class SelectionsController < ApplicationController

  def destroy
    @cart = Cart.find_by(user_id: current_user.id)
    @selection = Selection.find(params[:id])
    @selection.destroy
    flash[:success] = "Produit supprimé du panier avec succès!"
      puts "Succès ! #{@selection} a été supprimé du panier #{Cart.find_by(user_id: current_user.id)}"
      redirect_to carts_path
  end

end
