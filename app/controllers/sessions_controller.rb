class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.find_by_email(params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            session[:code] = user.code if user.code
            if admin?
                redirect_to admin_factions_path
            else
                redirect_to user_path(user.id)
            end
        else
            redirect_to '/login', notice: "Incorrect Username or Password"
        end
    end

    def destroy 
        session.delete(:user_id)
        session.delete(:code)
        redirect_to root_url
    end
end