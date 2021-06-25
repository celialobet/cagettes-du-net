class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @orders = current_user.orders 
    respond_to do |format|
        format.html {}
        format.js {}
      end
  end

  def update
    @location = Location.find(params[:location_id])
    current_user.location_id = @location.id
    current_user.save
    redirect_to root_path
  end

end
