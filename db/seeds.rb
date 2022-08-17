# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

lodgings = FactoryBot.create_list(:lodging, 10)
team = FactoryBot.create(:team)
guests = FactoryBot.create_list(:guest, 10, lodging_id: lodgings.first.id, team_id: team.id) 