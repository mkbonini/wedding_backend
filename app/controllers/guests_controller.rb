class GuestsController < ApplicationController
    before_action :set_guest, only: [:show, :update, :destroy]

    def index
      @guests = Guest.all
      json_response(@guests)
    end
  
    def create
      @guest = Guest.create!(guest_params)
      json_response(@guest, :created)
    end
  
    def show
      json_response(@guest)
    end
  
    def update
      @guest.update(guest_params)
      head :no_content
    end
  
    def destroy
      @guest.destroy
      head :no_content
    end
  
    private
  
    def guest_params
      params.permit(:first_name, :last_name, :rsvp, :email, :diet, :meals, :payment_method, :arrival_date, :age, :plus_ones, :comments, :team_id, :lodging_id)
    end

    def set_guest
        @guest = Guest.find(params[:id])
    end
end
