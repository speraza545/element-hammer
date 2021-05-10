class FactionsController < ApplicationController
    def show
        if logged_in?
            @faction = Faction.find(params[:id])
        else
            not_logged_in
            redirect_to login_path
        end
    end 

    def index 
        if logged_in?
            @factions = Faction.all
        else
            not_logged_in
            redirect_to login_path
        end
    end

end