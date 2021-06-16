class BasketsController < ApplicationController
  def show
    @baskets = Basket.find(params[:id])
    puts params
  end
end
