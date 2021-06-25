class AdminMailer < ApplicationMailer
  default from: 'no-reply-les-cagettes@yopmail.com'
  
  def location_email(location)

    @new_location = location

    mail(to: "franc.dev.thp@gmail.com", subject: 'Un nouveau lieu de livraison plébiscité !')

  end

end
