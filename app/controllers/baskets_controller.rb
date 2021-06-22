class BasketsController < ApplicationController
  include ApplicationHelper
  def show
    @baskets = Basket.find(params[:id])
  end

  def index
    @baskets = Basket.all
    
    @locations = Location.all
    city_list(@locations)
  end
end
