class UserMailer < ApplicationMailer
  default from: 'no-reply-les-cagettes@yopmail.com'
 
  def welcome_email(user)
    @user = user 

    @url  = 'https://cagettes-du-net.herokuapp.com/' 

    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end
end
