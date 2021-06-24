module LocationsHelper

  def is_current_user_subscriber
    @attendees = []
    @location.subscription.each do |subscription|
      if subscription.user_id == current_user.id
        return true
      end
    end
  end

end
