class PlusOne < ApplicationRecord
  belongs_to :guest
  belongs_to :team, optional: true
  belongs_to :lodging, optional: true
  # after_create :increase_party_count, :set_lodging_id
  # after_destroy :decrese_party_count

  after_create :set_lodging_id

  private
  def increase_party_count
    guest = Guest.find(self.guest_id)
    party_count = guest.party_count + 1
    bed_count = guest.bed_count + 1
    guest.update_attributes(:party_count => party_count, :bed_count => bed_count)
  end

  def decrese_party_count
    guest = Guest.find(self.guest_id)
    party_count = guest.party_count - 1
    bed_count = guest.bed_count - 1
    guest.update_attributes(:party_count => party_count, :bed_count => bed_count)
  end

  def set_lodging_id
    guest = Guest.find(self.guest_id)
    lodging_id = guest.lodging_id
    lodging = Lodging.find(lodging_id) if lodging_id != nil
    if lodging_id != nil and lodging.spots_remaining > 0
      self.update_attributes(:lodging_id => lodging_id)
    end
  end
end