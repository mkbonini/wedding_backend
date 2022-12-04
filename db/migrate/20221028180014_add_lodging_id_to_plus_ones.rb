class AddLodgingIdToPlusOnes < ActiveRecord::Migration[5.2]
  def change
    add_reference :plus_ones, :lodging, foreign_key: true
    add_reference :plus_ones, :team, foreign_key: true
  end
end
