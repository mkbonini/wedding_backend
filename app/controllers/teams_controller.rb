class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]

    def index
      @teams = Team.all
      json_response(@teams)
    end
  
    def create
      @team = Team.create!(team_params)
      json_response(@team, :created)
    end
  
    def show
      json_response(@team)
    end
  
    def update
      @team.update(team_params)
      head :no_content
    end
  
    def destroy
      @team.destroy
      head :no_content
    end

    def dodge
      # binding.pry
      # if params["name"].class == "Array"
        params["name"].each do |name|
          @guest = Guest.where("first_name || ' ' || last_name like :n", :n => "%#{name}")
          @kid = Kid.find_by(name: name)
          @plus_one = PlusOne.find_by(name: name)
          if @guest.count > 0
            @guest.first.update(team_id: 1)
            # binding.pry
          elsif @kid
            @kid.update(team_id: 1)
          elsif @plus_one
            @plus_one.update(team_id: 1)
          else
          end
        end
      # else
      #   @guest = Guest.where("first_name || ' ' || last_name like :n", :n => "%#{params["name"]}")
      #   if @guest
      #     @guest.update(team_id: 1)
      #   end
      # end
    end
  
    private
  
    def team_params
      params.permit(:name, :theme, :_json)
    end
  
    def set_team
      @team = Team.find(params[:id])
    end
end
