class UsersController < ApplicationController

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
    flash[:success] = "Votre nouveau lieu de livraison est le #{@location.name}"
    redirect_to root_path
  end

end
