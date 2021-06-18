class SelectionsController < ApplicationController

  def new
    @selection = Selection.new
  end

  def create
    @selection = Selection.new
    @selection.cart = Cart.find_by(user_id: current_user.id)
    puts params
    @params_basket = params[:basket_id]
    
    if params[:basket_id] != nil
      @selection.basket_id = @params_basket
      puts params
      puts @params_basket
    else
      @selection.additional_products_id = params[:additional_products_id]
    end
    if @selection.save
      flash[:success] = "Produit ajouté au panier!"
      puts "Succès ! #{@selection} a été ajouté au panier #{Cart.find_by(user_id: current_user.id)}"
      redirect_to root_path
      
    else
      flash[:error] = @selection.errors.messages
      puts "Nul !"
      
    end
  end
  
  
  
  
  def destroy
    @cart = Cart.find_by(user_id: current_user.id)
    @selection = Selection.find(params[:id])
    @selection.destroy
    flash[:success] = "Produit supprimé du panier avec succès!"
      puts "Succès ! #{@selection} a été supprimé du panier #{Cart.find_by(user_id: current_user.id)}"
      redirect_to carts_path
  end

end
