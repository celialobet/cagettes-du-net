class SelectionsController < ApplicationController
  include ApplicationHelper

  def create
    @selection = Selection.new(cart_id: current_user_cart.id)
    
    if params[:basket_id]
      @selection.basket_id = params[:basket_id]
    else
      @selection.additional_products_id = params[:additional_products_id]
    end
    if @selection.save
      flash[:success] = "Produit ajouté au panier!"
      redirect_to root_path      
    else
      flash[:error] = @selection.errors.messages
      puts "Nul !"
    end
  end
  
  
  
  
  def destroy
    @selection = Selection.find(params[:id])
    
    @selection.destroy
    flash[:success] = "Produit supprimé du panier avec succès!"
    redirect_to cart_path(current_user_cart)
  end

end
