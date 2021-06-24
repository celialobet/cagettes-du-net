class BasketsController < ApplicationController
  include ApplicationHelper
  def show
    @baskets = Basket.find(params[:id])
  end

  def index
    @baskets = Basket.all

    @additional_products = AdditionalProduct.all
    @additional_products_available = []
    @additional_products.each do |additional_product|
      if additional_product.is_available == true
        @additional_products_available.push(additional_product)
      end
    end
    @stars = @additional_products_available.last(5)

    @locations = Location.all
    city_list(@locations)
    if user_signed_in?
      @cart = current_user.cart
    end
  end
end