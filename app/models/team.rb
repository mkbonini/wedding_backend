class Team < ApplicationRecord
    has_many :guests

    validates_presence_of :name, :theme
end
