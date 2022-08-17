class Guest < ApplicationRecord
  belongs_to :logging
  belongs_to :team

  validates_presence_of :first_name, :last_name, :email, :rsvp, :diet, :meals, :payment_method, :arrival_date, :age, :plus_ones, :comments

  enum rsvp: { "no": 0, "yes": 1 }
end
