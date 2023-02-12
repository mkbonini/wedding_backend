class Guest < ApplicationRecord
  belongs_to :lodging, optional: true
  belongs_to :team, optional: true
  has_many :kids
  has_many :plus_ones
  after_initialize :set_defaults
  validates_presence_of :first_name, :last_name
  before_save :format_values
  before_update :remove_associations, if: :will_save_change_to_rsvp?

  enum rsvp:  {no: 0, yes: 1, pending: 2}, _prefix: :rsvp
  enum breakfast: {no: 0, yes: 1}, _prefix: :breakfast
  enum arrival_date:  {friday: 0, saturday: 1}

  def full_name
    [first_name, last_name].join(' ')
  end

  def party
    party = self.full_name

    self.kids.each do |kid|
      party = party + ", " + kid.name
    end

    self.plus_ones.each do |po|
      party = party + ", " +  po.name
    end
    return party
  end

  def lodging_response
    if lodging.name == "off-site"
      return "No"
    else
      return "Yes"
    end
  end

  def dodgeball
    dodge = []
    dodge << self.full_name if self.team_id != nil
    self.kids.each do |kid|
      dodge << kid.name if kid.team_id != nil
    end

    self.plus_ones.each do |po|
      dodge << po.name if po.team_id != nil
    end
    return dodge
  end

  def remove_associations
    if self.rsvp == "no" and self.lodging_id != nil
      self.update_attributes(:lodging_id => nil, :team_id => nil, :breakfast => nil)

      self.kids.each do |kid|
        kid.update_attributes(:lodging_id => nil, :team_id => nil)
      end
  
      self.plus_ones.each do |po|
        po.update_attributes(:lodging_id => nil, :team_id => nil)
      end
    end
  end

  private
  def set_defaults
    self.plus_one_count ||= 0 
    self.party_count ||= 1
    self.bed_count ||= 1
  end

  def format_values
    self.first_name = self.first_name.strip
    self.last_name = self.last_name.strip
  end
end
