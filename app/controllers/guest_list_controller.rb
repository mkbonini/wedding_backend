class GuestListController < ApplicationController

  def index
    guest_list = []
    Guest.all.each do |guest|
      h = {}
      h[:name] = guest.full_name
      h[:guest_id] = guest.id
      guest_list << h 
    end
    PlusOne.all.each do |plus_one|
      h = {}
      h[:name] = plus_one.name
      h[:guest_id] = plus_one.guest_id
      guest_list << h
    end
    json_response(guest_list)
  end

  private
end
