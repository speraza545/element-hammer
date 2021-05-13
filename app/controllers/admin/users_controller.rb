class Admin::UsersController < ApplicationController 
    def show
        if logged_in? && current_user.id === User.find(params[:id]).id || admin? 
            @user = User.find(params[:id])
        else
            not_admin
            redirect_to admin_signup_path
        end
    end

    def index
        @users = User.all
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
            user = User.find_by(email: params[:user][:email])
            if user && user.id != User.find(params[:id]).id
                email_taken
                redirect_to edit_admin_user_path
            else
                user = User.find(params[:id])
                user.update(user_params)
                redirect_to admin_user_path(user)
            end

        else
            redirect_to login_path
        end
    end

    def destroy
        if logged_in? && current_user.id === User.find(params[:id]).id || admin?
            user_factions = UserFaction.where(user_id = params[:id])
            user_factions.each do |user_faction|
                user_faction.delete
            end
            user = User.find(params[:id])
            user.delete
            redirect_to admin_users_path
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