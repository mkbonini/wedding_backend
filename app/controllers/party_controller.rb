class PartyController < ApplicationController
  before_action :set_guest, only: [:create]

  def create
    if !params["plus_ones"].empty?
      plus_ones = params["plus_ones"]
      plus_ones.each do |plus_one|
        @guest.plus_ones.create(plus_one['name'])
      end
    end
    if !params["kids"].empty? 
      params["kids"].each do |kid|
        @guest.kids.create(kid['name'], kid['age'])
      end
    end
    binding.pry
  end

  def show
    json_response(@guest)
  end

  private

  def kid_params
    params.permit(:first_name, :last_name, :rsvp, :email, :diet, :meals, :payment_method, :arrival_date, :party_count, :plus_one_count, :comments, :team_id, :lodging_id)
  end

  def plus_ones_params
    params.permit(:first_name, :last_name, :rsvp, :email, :diet, :meals, :payment_method, :arrival_date, :party_count, :plus_one_count, :comments, :team_id, :lodging_id)
  end

  def set_guest
      @guest = Guest.find(params[:guest_id])
  end
end
