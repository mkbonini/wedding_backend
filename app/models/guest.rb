class Guest < ApplicationRecord
  belongs_to :lodging, optional: true
  belongs_to :team, optional: true
  has_many :kids
  has_many :plus_ones
  after_initialize :set_defaults
  validates_presence_of :first_name, :last_name

  enum rsvp:  {no: 0, yes: 1, pending: 2}, _prefix: :rsvp
  enum breakfast: {no: 0, yes: 1}, _prefix: :breakfast
  enum arrival_date:  {friday: 0, saturday: 1}

  def full_name
    [first_name, last_name].join(' ')
  end
  private
  def set_defaults
    self.plus_one_count ||= 0 
    self.party_count ||= 1
    self.bed_count ||= 1
  end
end
