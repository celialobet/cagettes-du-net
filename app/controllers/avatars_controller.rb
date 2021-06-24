class AvatarsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    redirect_to(edit_user_registration_path(@current_user))
  end

  def update
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    redirect_to(edit_user_registration_path(@current_user))
  end
end
