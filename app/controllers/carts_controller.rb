class CartsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!

  def create
    if user_signed_in?
      @cart = Cart.create(user: current_user)
      puts "Nouveau panier créé pour #{current_user.first_name}"
    end
  end

  def show
    @cart = Cart.find_by(user_id: current_user.id)
    @baskets = Basket.all
    respond_to do |format|
      format.html {redirect_to cart_path(current_user_cart)}
      format.js { }
    end 
  end

  def index

  end
end
