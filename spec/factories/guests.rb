FactoryBot.define do
  factory :guest do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name  }
    email { Faker::Internet.email  }
    rsvp { Faker::Number.between(from: 0, to: 1)  }
    diet { Faker::Lorem.sentence }
    payment_method { 1 }
    arrival_date { ["friday", "saturday"].sample }
    party_count { 1 }
    bed_count { 1 }
    plus_one_count { Faker::Number.between(from: 0, to: 1) }
    comments { Faker::Lorem.sentence }
    lodging { nil }
    team { nil }
    breakfast { Faker::Number.between(from: 0, to: 1) }
  end
end
