class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.find_by_email(params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
        redirect_to '/login', notice: "Incorrect Username or Password"
        end
    end

    def destroy 
        session.delete(:user_id)
        redirect_to root_url
    end
end