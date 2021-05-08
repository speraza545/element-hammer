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
        user = User.new(params[:user_params])
        if user.save
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
        user.update(params[:user_params])
        redirect_to user_path(user)
    end

    def destroy
        faction = Faction.find(params[:id])
        faction.destroy
    end
end