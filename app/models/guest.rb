class Guest < ApplicationRecord
  belongs_to :lodging, optional: true
  belongs_to :team, optional: true
  has_many :kids
  has_many :plus_ones

  validates_presence_of :first_name, :last_name

  enum rsvp: { "no": 0, "yes": 1, "pending": 2 }
end
