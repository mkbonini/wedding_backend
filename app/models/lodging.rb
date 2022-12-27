class Lodging < ApplicationRecord
    has_many :guests
    has_many :kids
    has_many :plus_ones

    validates_presence_of :name, :lodging_type, :capacity

    enum lodging_type: { "male": 0, "female": 1, "coed": 2, "rv": 3, "appartment": 4 }

    def occupants
        ordered_list = self.guests.flat_map do |guest|
            [guest] + guest.kids + guest.plus_ones
        end
        occupant_list = (self.guests + self.kids + self.plus_ones).flatten
        ordered_list.keep_if { |guest| occupant_list.include?(guest) }
        ordered_list = (ordered_list + occupant_list).uniq

        name_list = ordered_list.map do |occupant|
            # binding.pry
            if occupant.class == Guest
                occupant.first_name + " " + occupant.last_name
            else
                occupant.name
            end
        end
        (self.capacity - name_list.length).times do
            name_list.push("Spot Available")
        end
        name_list
    end

    def spots_remaining
        occupant_list = (self.guests + self.kids + self.plus_ones).flatten
        capacity - occupant_list.length
    end
end
