require 'rails_helper'

RSpec.describe Guest, type: :model do
  it { should belong_to (:lodging) }
  it { should belong_to (:team) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:rsvp) }
  it { should validate_presence_of(:diet) }
  it { should validate_presence_of(:meals) }
  it { should validate_presence_of(:payment_method) }
  it { should validate_presence_of(:arrival_date) }
  it { should validate_presence_of(:age) }
  it { should validate_presence_of(:plus_ones) }
end
