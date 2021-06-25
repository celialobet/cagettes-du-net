class CartsController < ApplicationController

  before_action :authenticate_user!

  def create
    if user_signed_in?
      @cart = Cart.create(user: current_user)
    end
  end

  def show
    @cart = Cart.find_by(user_id: current_user.id)
    @baskets = Basket.all
    @locations = Location.all
    if current_user.location_id != nil
      @location = Location.find(current_user.location_id)
    end
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

    respond_to do |format|
      format.html {}
      format.js { }
    end
  end

  def index

  end
end
