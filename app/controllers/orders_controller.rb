class OrdersController < ApplicationController

  def create
    @order = Order.new
    @cart = Cart.find(params[:id])
    @order.user_id = current_user.id
    @order.save
    @selections = @cart.selections
    @selections.each do |selection|
      selection.cart_id = nil
      selection.order_id = @order.id
      selection.save
    end
    
  end
end
