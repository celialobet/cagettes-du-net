class LocationsController < ApplicationController
include ApplicationHelper
  def show
    @location = Location.find(params[:id])
    @cart = current_user_cart
  end

  def index
    @locations = Location.all
    @cart = current_user_cart
  end
end
