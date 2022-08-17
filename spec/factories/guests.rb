FactoryBot.define do
  factory :guest do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    rsvp { 1 }
    diet { "MyString" }
    meals { "MyText" }
    payment_method { 1 }
    arrival_date { "MyString" }
    age { 1 }
    plus_ones { 1 }
    comments { "MyString" }
    logging { nil }
    team { nil }
  end
end
