class SelectionsController < ApplicationController
  include ApplicationHelper

  def create
    @selection = Selection.new(cart_id: current_user_cart.id)
    @locations = Location.all
    if params[:basket_id]
      @selection.basket_id = params[:basket_id]
      @basket = Basket.find(@selection.basket_id)
    else
      @selection.additional_products_id = params[:additional_products_id]
    end
    if @selection.save
      flash[:success] = "Produit ajouté au panier!"
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js { }
      end     
    else
      flash[:error] = @selection.errors.messages
      puts "Nul !"
    end
  end
  
  
  
  
  def destroy
    @selection = Selection.find(params[:id])
    
    @selection.destroy
    respond_to do |format|
      format.html {redirect_to new_order_path}
      format.js { }
    end
    flash[:success] = "Produit supprimé du panier avec succès!"
  end

end
