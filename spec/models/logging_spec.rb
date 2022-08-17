require 'rails_helper'

RSpec.describe Logging, type: :model do
  it { should have_many(:guests) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:capacity) }
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:description) }
end
