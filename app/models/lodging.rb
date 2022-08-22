class Lodging < ApplicationRecord
    has_many :guests

    validates_presence_of :name, :lodging_type, :capacity, :url, :description

    enum lodging_type: { "male": 0, "female": 1, "coed": 2, "rv": 3, "appartment": 4 }
end