class CheckoutController < ApplicationController

  def create
    @total = params[:total].to_d
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          name: 'Rails Stripe Checkout',
          amount: (@total*100).to_i,
          currency: 'eur',
          quantity: 1
        },
      ],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    respond_to do |format|
      format.js # renders create.js.erb
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    @cart = Cart.find_by(user_id: current_user.id)
    @order = Order.create(user_id: current_user.id)

    @cart.selections.each do |selection|
      selection.cart_id = nil
      selection.order_id = @order.id
      selection.save
    end
  end

  def cancel
  end
  
end
