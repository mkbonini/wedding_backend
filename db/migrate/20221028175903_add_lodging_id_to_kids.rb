class AddLodgingIdToKids < ActiveRecord::Migration[5.2]
  def change
    add_reference :kids, :lodging, foreign_key: true
    add_reference :kids, :team, foreign_key: true
  end
end
