class ArmiesController < ActiveRecord::Base
    def show
        @user_faction = UserFaction.find(params[:id])
    end 

    def index 
        @user_factions = UserFaction.all
    end 

    def new
        @user_faction = UserFaction.new
    end 

    def create 
        user_faction = UserFaction.new(params[:user_faction_params])
        if user_faction.save
            redirect_to user_faction_path(user_faction)
        else 
            redirect_to user_faction_new_path
        end
    end

    def edit 
        @user_faction = UserFaction.find(params[:id])
    end 

    def update 
        fuser_faction = UserFaction.find(params[:id])
        fuser_faction.update(params[:user_faction_params])
        redirect_to user_faction_path(user_faction)
    end

    def destroy
        user_faction = Faction.find(params[:id])
        user_faction.destroy
    end
end