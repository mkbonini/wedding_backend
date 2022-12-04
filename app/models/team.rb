class Team < ApplicationRecord
    has_many :guests
    has_many :kids
    has_many :plus_ones

    validates_presence_of :name, :theme
end
