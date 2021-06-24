class BasketsController < ApplicationController
  include ApplicationHelper
  def show
    @baskets = Basket.find(params[:id])
  end

  def index
    @baskets = Basket.all
    @additional_products = AdditionalProduct.all
    a = @additional_products
    @stars = a.last(5)
    @locations = Location.all
    city_list(@locations)
    if user_signed_in?
      @cart = current_user.cart
    end
  end
end
