class Admin::FactionsController < ApplicationController
    def show
        @faction = Faction.find(params[:id])
    end 

    def index 
        @factions = Faction.all
    end 

    def new 
        @faction = Faction.new
    end

    def edit 
        @faction = Faction.find(params[:id])
    end 

    def update 
        faction = Faction.find(params[:id])
        faction.update(params[:faction_params])
        redirect_to faction_path(faction)
    end

    def destroy
        faction = Faction.find(params[:id])
        faction.destroy
    end
end