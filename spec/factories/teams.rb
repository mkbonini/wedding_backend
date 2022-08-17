FactoryBot.define do
  factory :team do
    name { Faker::Superhero.name }
    theme { Faker::Superhero.power }
  end
end
