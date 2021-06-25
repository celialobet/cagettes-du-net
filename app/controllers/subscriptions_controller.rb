class SubscriptionsController < ApplicationController
  include LocationsHelper
  
  def new
    @location_subscription = Subscription.create(user_id: current_user.id, location_id: params[:location_id])
    respond_to do |format|
      format.html {redirect_to locations_path}
      format.js { }
    end
  end

  def destroy
    @locations = Location.all
    @subscription = Subscription.find(params[:id])
    
    @subscription.destroy
    respond_to do |format|
      format.html {redirect_to locations_path}
      format.js { }
    end
  end

end
