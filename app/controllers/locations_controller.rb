class LocationsController < ApplicationController
  include ApplicationHelper
  
  def new
    @location = Location.new
  end


  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "Formulaire soumis!"
      redirect_to(root_path)
    else
      render "new"
    end
  end

  def show
  @location = Location.find(params[:id])
    
    @cart = current_user_cart
  end

  def index
    @locations = Location.all
    @cart = current_user_cart
    if current_user.location_id != nil
      @location = Location.find(current_user.location_id)
    else
      @location = Location.find(params[:id])
    end
  end

  private 

  def location_params
    params.permit(:name, :description, :address_number, :address_street, :zip_code, :day, :time, :opening_hours)
  end
end
