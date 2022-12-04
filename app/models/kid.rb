class Kid < ApplicationRecord
  belongs_to :guest
  belongs_to :team
  belongs_to :lodging
end