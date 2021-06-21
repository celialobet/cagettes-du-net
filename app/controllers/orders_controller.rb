class OrdersController < ApplicationController
  def new
    @baskets = Basket.all
    @locations = Location.all
  end
  
end
