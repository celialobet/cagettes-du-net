class UsersController < ApplicationController

    def show
        @user = current_user 
    end
    
    def edit
        @user = current_user
        respond_to do |format|
            format.html {redirect_to cart_path(current_user_cart)}
            format.js { }
        end
    end

end
