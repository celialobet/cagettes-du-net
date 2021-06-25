class LocationsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  
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
    if user_signed_in?
      @cart = current_user.cart
    end
  end

  def index
    @locations = Location.all
    if user_signed_in?
      @cart = current_user.cart
      @subscription = Subscription.find_by(user_id: current_user.id)
    end
  end

  private 

  def location_params
    params.permit(:name, :description, :address_number, :address_street, :zip_code, :day, :time, :opening_hours)
  end
end
