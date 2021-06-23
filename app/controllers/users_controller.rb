class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @orders = current_user.orders 
        respond_to do |format|
            format.html {}
            format.js {}
          end
    end

end
