FactoryBot.define do
  factory :kid do
    name { Faker::Name.name }
    age { Faker::Number.between(from: 0, to: 15)  }
    needs_bed { 1 }
    lodging { nil }
    team { nil }
    guest { nil }
  end
end
