class Admin::UsersController < ApplicationController
    def show
        if logged_in? && current_user.id === User.find(params[:id]).id || admin? 
            @user = User.find(params[:id])
        else
            not_admin
            redirect_to admin_signup_path
        end
    end 

    def new 
        @user = User.new
    end 

    def edit 
        if logged_in? && current_user.id === User.find(params[:id]).id || admin?
            @user = User.find(params[:id])
        else
            not_admin
            redirect_to admin_signup_path
        end
    end 

    def update
        if logged_in? && current_user.id === User.find(params[:id]).id || admin?
            user = User.find(params[:id])
            user.update(user_params)
            redirect_to user_path(user)
        else
            not_admin
            redirect_to admin_signup_path
        end
    end

    def destroy
        if logged_in? && current_user.id === User.find(params[:id]).id || admin?
            user = User.find(params[:id])
            user.destroy
        else
            not_admin
            redirect_to admin_signup_path
        end
    end

private
    def user_params
        params.require(:user).permit(:name, :email, :password, :code)
    end
end