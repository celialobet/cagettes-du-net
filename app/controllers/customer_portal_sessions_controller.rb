class CustomerPortalSessionsController < ApplicationController
  def create
    portal_session = Stripe::BillingPortal::Session.create(
      customer: current_user.stripe_customer_id,
      return_url: "https://cagettes-du-net.herokuapp.com/"
    )
    redirect_to portal_session.url
  end
end
