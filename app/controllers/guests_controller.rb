class GuestsController < ApplicationController
    before_action :set_guest, only: [:show, :update, :destroy]

    def index
      @guests = Guest.all
      guest_response(@guests)
    end
  
    def create
      @guest = Guest.create!(guest_params)
      guest_response(@guest, :created)
    end
  
    def show
      guest_response(@guest)
    end
  
    def update
      if guest_params.include?('lodging_id')
        @lodging = Lodging.find(guest_params['lodging_id'])
        if @lodging.guests.count + @lodging.kids.count + @lodging.plus_ones.count + @guest.party_count > @lodging.capacity
          return json_response("There is not enough space in the lodging selected", :bad_request)
        end
        @guest.kids.each do |kid|
          kid.update(lodging_id: guest_params['lodging_id'])
        end
        @guest.plus_ones.each do |plus_one|
          plus_one.update(lodging_id: guest_params['lodging_id'])
        end
      end
      @guest.update(guest_params)
      head :no_content

      # GuestMailer.with(guest: @guest).welcome_email.deliver_later
    end
  
    def destroy
      @guest.destroy
      head :no_content
    end
  
    private
  
    def guest_params
      params.permit(:first_name, :last_name, :rsvp, :email, :diet, :meals, :payment_method, :arrival_date, :party_count, :plus_one_count, :comments, :team_id, :lodging_id)
    end

    def set_guest
        @guest = Guest.find(params[:id])
    end
end
