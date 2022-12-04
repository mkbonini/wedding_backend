class Guest < ApplicationRecord
  belongs_to :lodging
  belongs_to :team
  has_many :kids
  has_many :plus_ones

  validates_presence_of :first_name, :last_name, :email, :rsvp, :payment_method, :arrival_date, :plus_one_count

  enum rsvp: { "no": 0, "yes": 1, "pending": 2 }
end
