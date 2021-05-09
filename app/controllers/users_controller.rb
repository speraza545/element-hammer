class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end 

    def new 
        @user = User.new
    end 

    def create
        if user_params[:code] != ""
            if User.is_admin?(user_params[:code])
                user = User.new(user_params)
                if user.save
                    session[:user_id] = user.id
                    redirect_to admin_user_path(user)
                end
            else 
                redirect_to new_admin_user_path
            end
        else 
            user = User.new(user_params)
            if user.save
                session[:user_id] = user.id
                redirect_to user_path(user)
            else 
                redirect_to user_new_path
            end
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
        params.require(:user).permit(:name, :email, :password, :code)
    end
end