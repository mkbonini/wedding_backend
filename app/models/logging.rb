class Logging < ApplicationRecord
    has_many :guests

    validates_presence_of :name, :type, :capacity, :url, :description

    enum type: { "male": 0, "female": 1, "coed": 2, "rv": 3, "appartment": 4 }
end
