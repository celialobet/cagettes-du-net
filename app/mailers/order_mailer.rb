class OrderMailer < ApplicationMailer
  default from: 'no-reply-les-cagettes@yopmail.com'

  def order_email(order)
    
    @order = order
    @user = @order.user

    mail(to: @user.email, subject: 'Merci pour votre commande !') 

  end

  def subscription_email(current_user)
    
    @user = current_user

    mail(to: @user.email, subject: 'Merci pour votre abonnement !') 

  end

  def delivery_email(delivery)
    @user = delivery.user
    @time = delivery.time.strftime("Le %d/%m à %H:%M")
    @location = delivery.location

    mail(to: @user.email, subject: 'Récapitulatif avant livraison') 

  end
end
