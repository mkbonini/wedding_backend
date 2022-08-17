require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many(:guests) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:theme) }
end
