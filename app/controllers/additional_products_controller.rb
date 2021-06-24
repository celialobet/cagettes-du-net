class AdditionalProductsController < ApplicationController
include ApplicationHelper
  def index
    @additional_products = AdditionalProduct.all
    @cart = current_user_cart
    @cart.step = 1
  end
    
end
