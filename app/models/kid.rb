class Kid < ApplicationRecord
  belongs_to :guest
  belongs_to :team, optional: true
  belongs_to :lodging, optional: true
  after_create :increase_party_count
  after_destroy :decrese_party_count

  enum needs_bed: { "no": 0, "yes": 1 }
  enum child_care: { "sitter": 0, "guardian": 1 }

  private
  def increase_party_count
    guest = Guest.find(self.guest_id)
    party_count = guest.party_count + 1
    bed_count = guest.bed_count
    bed_count += 1 if needs_bed == "yes"
    guest.update_attributes(:party_count => party_count, :bed_count => bed_count)
  end

  def decrese_party_count
    guest = Guest.find(self.guest_id)
    party_count = guest.party_count - 1
    bed_count = guest.bed_count
    bed_count -= 1 if needs_bed == "yes"
    guest.update_attributes(:party_count => party_count, :bed_count => bed_count)
  end
end