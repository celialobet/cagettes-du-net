class CheckoutController < ApplicationController

  def create
    puts params[:engagement]
    puts params[:engagement].to_s
    @total = current_user.cart.total_cart
    @basket_price = params[:price].to_s

    if params[:engagement] === "single"
      @mode = "payment"
      @line_items = [
        {
          name: 'Rails Stripe Checkout',
          amount: (@total*100).to_i,
          currency: 'eur',
          quantity: 1
        },
      ]
    elsif params[:engagement] === "subscription"
      @mode = "subscription"
      @line_items = [
        {
          price: @basket_price,
          quantity: 1
        },
      ]
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      mode: @mode,
      line_items: @line_items,
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js # renders create.js.erb
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])

    @cart = Cart.find_by(user_id: current_user.id)
    @order = Order.create(user_id: current_user.id)

    if @session.mode === "payment"
      @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
      @cart.selections.each do |selection|
        selection.cart_id = nil
        selection.order_id = @order.id
        selection.save
      end
      @cart.step = 0
      @cart.save
      @delivery = Delivery.create(user_id: current_user.id, order_id: @order.id, location_id: current_user.location_id, time: current_user.location.time)

      OrderMailer.order_email(@order).deliver_now   

    elsif @session.mode === "subscription"  
      @delivery = Delivery.create(user_id: current_user.id, order_id: @order.id, location_id: current_user.location_id, time: current_user.location.time)
      OrderMailer.subscription_email.deliver_now   
    end

  end

  def cancel
  end
  
end
