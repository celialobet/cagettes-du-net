class BasketsController < ApplicationController

  def index
    @baskets = Basket.all
    @locations = Location.all
  end
end
