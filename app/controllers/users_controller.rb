class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end 

    def index 
        @users = User.all
    end 

    def new 
        @user = User.new
    end 

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            redirect_to user_new_path
        end
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
        params.require(:user).permit(:name, :username, :email, :password)
    end
end