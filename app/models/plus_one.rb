class PlusOne < ApplicationRecord
  belongs_to :guest
  belongs_to :team, optional: true
  belongs_to :lodging, optional: true
  after_create :increase_party_count
  after_destroy :decrese_party_count

  private
  def increase_party_count
    guest = Guest.find(self.guest_id)
    party_count = guest.party_count + 1
    guest.update_attributes(:party_count => party_count)
  end

  def decrese_party_count
    guest = Guest.find(self.guest_id)
    party_count = guest.party_count - 1
    guest.update_attributes(:party_count => party_count)
  end
end