class OrdersController < ApplicationController
  def new
    @baskets = Basket.all
    @locations = Location.all
    if current_user.location_id != nil
      @location = Location.find(current_user.location_id)
    end
    
    @cart = current_user.cart
    @additional_products = AdditionalProduct.all

    basket_array = []

    @cart.selections.each do |selection|
      if selection.additional_product_id == nil
      basket_array.push(selection)
      end
    end
    @basket_array = basket_array

    additional_product_array = []

    @cart.selections.each do |selection|
      if selection.basket_id == nil
      additional_product_array.push(selection)
      end
    end
    @additional_product_array = additional_product_array
  end
  
end
