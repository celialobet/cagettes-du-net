class OrdersController < ApplicationController
  def new
    @baskets = Basket.all
    @locations = Location.all
    @cart = current_user.cart
  end
  
end
