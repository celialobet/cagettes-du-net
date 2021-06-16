class BasketsController < ApplicationController
  def show
    @baskets = Basket.find(params[:id])
  end
end
