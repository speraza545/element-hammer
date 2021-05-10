class Admin::SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.find_by_email(params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            if admin?
                redirect_to admin_user_path(user.id)
            else
                redirect_to user_path(user.id)
            end
        else
            redirect_to '/login', notice: "Incorrect Username or Password"
        end
    end
end