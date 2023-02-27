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
      params["yes"].each do |person|
          case person[:type] 
          when "guest"
            @guest = Guest.find(person[:id])
            @guest.update!(team_id: 1)
          when "plus_one"
            @plus_one = PlusOne.find(person[:id])
            @plus_one.update!(team_id: 1)
          when "kid"
            @kid = Kid.find(person[:id])
            @kid.update!(team_id: 1)
          else
            return json_response("Invalid type", :bad_request)
          end
        end

        params["no"].each do |person|
          case person[:type] 
          when "guest"
            @guest = Guest.find(person[:id])
            @guest.update!(team_id: nil)
          when "plus_one"
            @plus_one = PlusOne.find(person[:id])
            @plus_one.update!(team_id: nil)
          when "kid"
            @kid = Kid.find(person[:id])
            @kid.update!(team_id: nil)
          else
            return json_response("Invalid type", :bad_request)
          end
        end
    end
  
    private
  
    def team_params
      model_attributes = [:name, :theme, :yes, :no, :type, :id]
      if params.key? '_json' 
        params.permit(_json: model_attributes)['_json'] 
      else
        params.permit(:name, :theme, :yes, :no, :type, :id)
      end
    end
  
    def set_team
      @team = Team.find(params[:id])
    end
end
