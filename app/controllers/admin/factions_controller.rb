class Admin::FactionsController < ApplicationController
    def show
        if admin?
        @faction = Faction.find(params[:id])
        else
            not_admin
            redirect_to admin_login_path
        end
    end 

    def index
        if admin? 
        @factions = Faction.all
        else
            not_admin
            redirect_to admin_login_path
        end
    end 

    def new
        if admin? 
        @faction = Faction.new
        else
            not_admin
            redirect_to admin_login_path
        end
    end 

    def create
        if session[:code] != nil
            if admin?
                faction = Faction.new(faction_params)
                if faction.save
                    redirect_to admin_faction_path(faction)
                else
                    save_issue
                    redirect_to new_admin_faction_path
                end
            else
                not_admin
                redirect_to admin_login_path
            end
        else
            not_admin
            redirect_to admin_login_path
        end
    end

    def edit
        if admin?
            @faction = Faction.find(params[:id])
        else
            not_admin
            redirect_to admin_login_path
        end
    end

    def update
        if admin?
            faction = Faction.find(params[:id])
            faction.update(faction_params)
            redirect_to admin_faction_path(faction)
        else
            not_admin
            redirect_to admin_login_path
        end
    end

    def destroy
        faction = Faction.find(params[:id])
        faction.destroy
        redirect_to admin_factions_path
    end

    private
    def faction_params
        params.require(:faction).permit(:name, :buff_type, :buff, :info)
    end

end