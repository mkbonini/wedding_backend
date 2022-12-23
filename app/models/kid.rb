class Kid < ApplicationRecord
  belongs_to :guest
  belongs_to :team, optional: true
  belongs_to :lodging, optional: true
  after_create :increase_party_count
  after_destroy :decrese_party_count

  private
  def increase_party_count
    guest = Guest.find(self.guest_id)
    party_count = guest.party_count
    guest.party_count = party_count + 1
    save
  end

  def decrese_party_count
    @guest = Guest.find(self.guest_id)
    @guest.decrement!(party_count)
  end
end