class Guest < ApplicationRecord
  belongs_to :logging
  belongs_to :team
end
