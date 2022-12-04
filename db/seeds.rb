# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'
lodgings_list = JSON.parse(File.read(Rails.root.join('db/seed_data/lodgings.json')))
lodgings_list.each do |lodging|
  # binding.pry
  Lodging.create!(lodging)
end
lodgings = Lodging.all
team = FactoryBot.create(:team)
guests = []
50.times.with_index do |i|
  guest = FactoryBot.create(:guest, lodging_id: lodgings.sample.id, team_id: team.id) 
  if i % 2 == 0
    kids = FactoryBot.create(:kid, lodging_id: lodgings.sample.id, team_id: team.id, guest_id: guest.id)
    plus_ones = FactoryBot.create(:plus_one, lodging_id: lodgings.sample.id, team_id: team.id, guest_id: guest.id) 
  end
  guests << guest
end
# 10.times do
#   kids = FactoryBot.create(:kid, lodging_id: lodgings.sample.id, team_id: team.id, guest_id: guests.sample.id) 
# end
# 20.times do
#   plus_ones = FactoryBot.create(:plus_one, lodging_id: lodgings.sample.id, team_id: team.id, guest_id: guests.sample.id) 
# end