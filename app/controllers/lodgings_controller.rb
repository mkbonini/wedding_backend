class LodgingsController < ApplicationController
    before_action :set_lodging, only: [:show, :update, :destroy]

    def index
      @lodgings = Lodging.all
      lodging_response(@lodgings)
    end
  
    def create
      @lodging = Lodging.create!(lodging_params)
      json_response(@lodging, :created)
    end
  
    def show
      lodging_response(@lodging)
    end
  
    def update
      @lodging.update(lodging_params)
      head :no_content
    end
  
    def destroy
      @lodging.destroy
      head :no_content
    end
  
    private
  
    def lodging_params
      params.permit(:name, :lodging_type, :capacity, :url, :description)
    end
  
    def set_lodging
      @lodging = Lodging.find(params[:id])
    end
end
