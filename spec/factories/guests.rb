FactoryBot.define do
  factory :guest do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name  }
    email { Faker::Internet.email  }
    rsvp { Faker::Number.between(from: 0, to: 1)  }
    diet { Faker::Lorem.sentence }
    meals { "MyText" }
    payment_method { 1 }
    arrival_date { ["friday", "saturday"].sample }
    age { 0 }
    plus_ones { Faker::Number.between(from: 0, to: 1) }
    comments { Faker::Lorem.sentence }
    lodging { nil }
    team { nil }
  end
end
