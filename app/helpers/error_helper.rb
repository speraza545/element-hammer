module ErrorHelper
    def email_taken
        flash[:email_taken] = "Email Taken"
    end

    def email_taken_output
        flash[:email_taken]
    end

    def army_name_taken
        flash[:army_name_taken] = "Army Name Taken"
    end

    def army_name_taken_output
        flash[:army_name_taken]
    end

    def not_admin
        flash[:not_admin] = "Please Create an Admin Account"
    end

    def not_admin_output
        flash[:not_admin]
    end

    def save_issue 
        flash[:save_issue] = "Please Try Again"
    end

    def save_issue_output
        flash[:save_issue]
    end

    def not_logged_in
        flash[:not_logged_in] = "Please Log in"
    end

    def not_logged_in_output
        flash[:not_logged_in]
    end

    def error_with_omniauth
        flash[:error_with_omniauth_output] = "Error With Omniauth, Please Try Again"
    end 

    def error_with_omniauth_output
        flash[:error_with_omniauth_output]
    end
end