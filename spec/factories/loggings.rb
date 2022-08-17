FactoryBot.define do
  factory :lodging do
    name { Faker::Space.planet }
    lodging_type { Faker::Number.between(from: 0, to: 3) }
    capacity { 6 }
    url { Faker::Internet.domain_name }
    description { Faker::Lorem.sentence }
  end
end
