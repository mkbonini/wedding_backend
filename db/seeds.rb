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
# guests = []
# 20.times.with_index do |i|
#   lodging_id = lodgings.sample.id
#   guest = FactoryBot.create(:guest, lodging_id: lodging_id) 
#   if i % 3 == 0
#     kids = FactoryBot.create(:kid, lodging_id: lodging_id, guest_id: guest.id)
#     plus_ones = FactoryBot.create(:plus_one, lodging_id: lodging_id, guest_id: guest.id) 
#   end
#   guests << guest
# end