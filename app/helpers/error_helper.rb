module ErrorHelper
    def email_taken
        flash[:email_taken] = "Email Taken"
    end

    def email_taken_output
        flash[:email_taken]
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
end