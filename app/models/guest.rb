class Guest < ApplicationRecord
  belongs_to :lodging
  belongs_to :team

  validates_presence_of :first_name, :last_name, :email, :rsvp, :diet, :meals, :payment_method, :arrival_date, :party_count, :plus_ones, :comments

  enum rsvp: { "no": 0, "yes": 1 }
end
