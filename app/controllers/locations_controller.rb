class LocationsController < ApplicationController

  
  def new
    @location = Location.new
  end


  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to(root_path)
    else
      render "new"
    end
  end

  def show
    @location = Location.find(params[:id])
    
    @cart = current_user.cart
  end

  def index
    @locations = Location.all
    @cart = current_user_cart
    @subscription = Subscription.find_by(user_id: current_user.id)

  end

  private 

  def location_params
    params.permit(:name, :description, :address_number, :address_street, :zip_code, :day, :time, :opening_hours)
  end
end
