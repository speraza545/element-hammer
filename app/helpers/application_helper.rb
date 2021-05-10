module ApplicationHelper
    def logged_in?
        !!current_user
    end 
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def admin?
        User.is_admin?(session[:code])
    end
end
