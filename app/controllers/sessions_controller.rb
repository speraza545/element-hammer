class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def omniauth #log users in with the omniauth
        user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.name = auth["info"]["first_name"]
            u.email = auth["info"]["email"]
            u.password = SecureRandom.hex(16)
        end
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            error_with_omniauth
            redirect_to signup_path
        end
    end

    def create
        user = User.find_or_create_by(email: params[:session][:email])
        user.password = params[:session][:password]
        user.save
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

    private
    def auth
        request.env['omniauth.auth']
    end
end