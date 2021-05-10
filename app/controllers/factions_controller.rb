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
        if session[:code] != nil
            if User.is_admin?(session[:code])
                faction = Faction.new(faction_params)
                if faction.save
                    redirect_to admin_faction_path(faction)
                else
                    flash[:save_issue] = "Please Try Again"
                    redirect_to new_admin_faction_path
                end
            else
                flash[:not_admin] = "Please Create an Admin Account"
                redirect_to new_admin_user_path
            end
        else
            flash[:not_admin] = "Please Create an Admin Account"
            redirect_to new_admin_user_path
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

    private
    def faction_params
        params.require(:faction).permit(:name, :buff_type, :buff)
    end

end