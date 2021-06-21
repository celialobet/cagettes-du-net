class AdditionalProductsController < ApplicationController

  def index
    @additional_products = AdditionalProduct.all
  end
    
end
