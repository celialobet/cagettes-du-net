class BasketsController < ApplicationController
  include ApplicationHelper
  def show
    @baskets = Basket.find(params[:id])
    puts params
  end

  def index
    @baskets = Basket.all
    @locations = Location.all
    city_list(@locations)
    if user_signed_in?
      @cart = current_user.cart
    end
  end
end
