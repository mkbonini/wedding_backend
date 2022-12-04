FactoryBot.define do
  factory :plus_one do
    name { Faker::Name.name }
    lodging { nil }
    team { nil }
    guest { nil }
  end
end
