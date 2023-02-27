class AddHasKidsToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :has_kids, :integer
  end
end
