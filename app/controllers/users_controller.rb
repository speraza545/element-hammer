class UsersController < ApplicationController
    def show
        if (logged_in? && current_user.id === session[:user_id]) || admin?
            @user = User.find(params[:id])
        end
    end 

    def new 
        @user = User.new
    end 

    def create
        if user_params[:code] != nil
            if User.find_by(email: user_params[:email])
                email_taken
                redirect_to admin_signup_path
            else
                if admin?(user_params[:code])
                    user = User.new(user_params)
                    if user.save
                        session[:user_id] = user.id
                        session[:code] = user.code
                        redirect_to admin_factions_path
                    end
                else
                    not_admin
                    redirect_to admin_signup_path
                end
            end
        else 
            if User.find_by(email: user_params[:email])
                email_taken
                redirect_to signup_path
            else
                user = User.new(user_params)
                if user.save
                    session[:user_id] = user.id
                    redirect_to user_path(user)
                else
                    save_issue
                    redirect_to new_user_path
                end
            end
        end
    end

    def edit
        if (logged_in? && current_user.id === session[:user_id]) || admin?
            @user = User.find(params[:id])
        end
    end 

    def update
        if (logged_in? && current_user.id === session[:user_id]) || admin?
            user = User.find(params[:id])
            user.update(user_params)
            redirect_to user_path(user)
        end
    end

    def destroy
        if (logged_in? && current_user.id === session[:user_id]) || admin?
            user = User.find(params[:id])
            user.destroy
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :code)
    end
end