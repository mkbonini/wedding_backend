class GuestsController < ApplicationController
    before_action :set_guest, only: [:show, :update, :destroy, :email, :kids]

    def index
      @guests = Guest.all
      guest_response(@guests)
    end
  
    def create
      @guest = Guest.create!(guest_params)
      head :no_content
      # guest_response(@guest, :created)
    end
  
    def show
      guest_response(@guest)
    end
  
    def update
      if guest_params.include?('lodging_id')
        @lodging = Lodging.find(guest_params['lodging_id']) if guest_params['lodging_id'] != nil
        if guest_params['lodging_id'] != nil and (@lodging.guests.count + @lodging.kids.count + @lodging.plus_ones.count + @guest.bed_count > @lodging.capacity)
          return json_response("There is not enough space in the lodging selected", :bad_request)
        else
          # @guest.kids.each do |kid|
          #   if kid.needs_bed == "yes"
          #     kid.update(lodging_id: guest_params['lodging_id'])
          #   end
          # end
          # @guest.plus_ones.each do |plus_one|
          #   plus_one.update(lodging_id: guest_params['lodging_id'])
          # end
          @guest.plus_ones.update(lodging_id: guest_params['lodging_id'])
          @guest.kids.yes.update(lodging_id: guest_params['lodging_id'])
        end
      end
      @guest.update(guest_params)
      head :no_content
    end
  
    def destroy
      @guest.destroy
      head :no_content
    end
    
    def email
      if @guest.rsvp == "no"
        GuestMailer.with(guest: @guest).no_email.deliver_later
      else
        GuestMailer.with(guest: @guest).welcome_email.deliver_later
      end
      GuestMailer.with(guest: @guest).notification_email.deliver_later
    end

    def email_reminder
      @guests = Guest.rsvp_yes
      @guests.each do |guest|
        GuestMailer.with(guest: guest).reminder_email.deliver_later
      end
    end

    def email_photo
      @guests = Guest.rsvp_yes
      @guests.each do |guest|
        GuestMailer.with(guest: guest).photo_email.deliver_later
      end
    end

    def kids
      ids = []
      kid_list_params.each do |kid_data|
        kid_data["child_care"] = kid_params["child_care"]
        kid_data["guest_id"] = @guest.id
        if kid_data.key?("id")  and kid_data["id"] != nil
          ids << kid_data["id"]
          kid = Kid.find(kid_data["id"])
          kid.update!(kid_data)
        else
          kid = Kid.create!(kid_data)
          ids << kid.id
        end
      end
      @guest.kids.where.not(id: ids).destroy_all
      head :no_content
    end

    def dodgeball
      @players =  Guest.where.not(team_id: nil)
      @players += Kid.where.not(team_id: nil)
      @players += PlusOne.where.not(team_id: nil)
      json_response(@players)
    end

    def correct_party_count
      @guests = Guest.all
      @guests.each do |guest|
        party_count = 1 + guest.kids.count + guest.plus_ones.count
        guest.update(party_count: party_count)
      end
    end
    private
  
    def guest_params
      model_attributes = [:first_name, :last_name, :rsvp, :email, :diet, :breakfast, :payment_method, :arrival_date, :party_count, :bed_count, :plus_one_count, :comments, :team_id, :lodging_id, :has_kids]
      if params.key? '_json' 
        params.permit(_json: model_attributes)['_json'] 
      else
        params.permit(:first_name, :last_name, :rsvp, :email, :diet, :breakfast, :payment_method, :arrival_date, :party_count, :bed_count, :plus_one_count, :comments, :team_id, :lodging_id, :has_kids)
      end
    end

    def kid_params
      model_attributes = [:id, :name, :age, :guest_id, :team_id, :lodging_id, :needs_bed, :child_care]
      if params.key? '_json'
        params.permit(_json: model_attributes)['_json'] 
      else
        params.permit(:name, :age, :guest_id, :team_id, :lodging_id, :needs_bed, :child_care)
      end
    end

    def kid_list_params
      model_attributes = [:id, :name, :age, :guest_id, :team_id, :lodging_id, :needs_bed, :child_care]
      if params.key? 'kids'
        params.permit(kids: model_attributes)['kids'] 
      else
        params.permit(:name, :age, :guest_id, :team_id, :lodging_id, :needs_bed, :child_care)
      end
    end

    def set_guest
        @guest = Guest.find(params[:id])
    end
end
