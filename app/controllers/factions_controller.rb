class FactionsController < ApplicationController
    def show
        @faction = Faction.find(params[:id])
    end 

    def index 
        @factions = Faction.all
    end 

    def new 
        @faction = Faction.new
    end 

    def create 
        faction = Faction.new(params[:faction_params])
        if faction.save
            redirect_to faction_path(faction)
        else 
            redirect_to faction_new_path
        end
    end

    def edit 
        @faction = Faction.find(params[:id])
    end 

    def update 
        faction = Faction.find(params[:id])
        faction.update(params[:faction_params])
        redirect_to faction_path(faction)
    end

end