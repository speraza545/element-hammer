class Admin::UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end 

    def new 
        @user = User.new
    end 

    def edit 
        @user = User.find(params[:id])
    end 

    def update 
        user = User.find(params[:id])
        user.update(user_params)
        redirect_to user_path(user)
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
    end

private
    def user_params
        params.require(:user).permit(:name, :email, :password, :code)
    end
end