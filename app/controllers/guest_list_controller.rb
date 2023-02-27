class GuestListController < ApplicationController

  def index
    guest_list = []
    Guest.all.each do |guest|
      h = {}
      h[:name] = Base64.strict_encode64(guest.full_name.downcase)
      h[:guest_id] = guest.id
      guest_list << h 
    end
    PlusOne.all.each do |plus_one|
      h = {}
      h[:name] = Base64.strict_encode64(plus_one.name.downcase)
      h[:guest_id] = plus_one.guest_id
      guest_list << h
    end
    json_response(guest_list)
  end

  private
end
