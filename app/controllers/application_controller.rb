class ApplicationController < ActionController::Base
    include ApplicationHelper
    include ErrorHelper
    include FactionHelper

    def home
    end

end
