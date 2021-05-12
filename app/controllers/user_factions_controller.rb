class UserFactionsController < ApplicationController
    def show
        if logged_in? && current_user.id === UserFaction.find(params[:id]).user_id || admin?
            @user_faction = UserFaction.find(params[:id])
        else 
            redirect_to login_user_path
        end
    end 

    def index
        if logged_in? 
            @user_factions = UserFaction.where(user_id: current_user.id).order_by_army_name ||""
        else
            not_logged_in
            redirect_to login_path
        end
    end 

    def new
        if logged_in?
        @user_faction = UserFaction.new
        @factions = Faction.all.map { |x| x.name}
        else
            not_logged_in
            redirect_to login_user_path
        end
    end 

    def create
        if logged_in?
            if UserFaction.find_by(army_name: params[:user_faction][:army_name])
                army_name_taken
                redirect_to new_user_faction_path
            else

                user_faction = UserFaction.new(army_name: params[:user_faction][:army_name], user_id: session[:user_id], faction_id: Faction.find_by( name: params[:user_faction][:faction_id]).id)

                if user_faction.save
                    redirect_to user_faction_path(user_faction)
                else 
                    save_issue
                    redirect_to new_user_faction_path
                end
            end
        else
            not_logged_in
            redirect_to login_user_path
        end
    end

    def edit
        if logged_in? && current_user.id === UserFaction.find(params[:id]).user_id || admin?
            @user_faction = UserFaction.find(params[:id])
        else 
            not_logged_in
            redirect_to login_user_path
        end
    end 

    def update
        if logged_in? && current_user.id === UserFaction.find(params[:id]).user_id || admin?
            fuser_faction = UserFaction.find(params[:id])
            fuser_faction.update(params[:user_faction_params])
            redirect_to user_faction_path(user_faction)
        else 
            not_logged_in
            redirect_to login_user_path
        end
    end

    def destroy
        if logged_in? && current_user.id === UserFaction.find(params[:id]).user_id || admin?
            user_faction = Faction.find(params[:id])
            user_faction.destroy
        else 
            not_logged_in
            redirect_to login_user_path
        end
    end
end