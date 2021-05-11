class UserFactionsController < ApplicationController
    def show
        @user_faction = UserFaction.find(params[:id])
    end 

    def index 
        @user_factions = UserFaction.all
    end 

    def new
        @user_faction = UserFaction.new
        @factions = Faction.all.map { |x| x.name}
    end 

    def create
        user_faction = UserFaction.new(army_name: params[:user_faction][:army_name], user_id: session[:user_id], faction_id: UserFaction.convert_name_to_id(params[:user_faction][:faction_id]))

        if user_faction.save
            redirect_to user_faction_path(user_faction)
        else 
            save_issue
            redirect_to new_user_faction_path
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