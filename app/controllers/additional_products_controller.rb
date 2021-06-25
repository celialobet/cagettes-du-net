class AdditionalProductsController < ApplicationController

  def index
    @additional_products = AdditionalProduct.all
    @cart = current_user.cart
    @cart.step = 1
  end
    
end
