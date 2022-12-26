class ChangeMealsToIntFromGuest < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :bed_count, :integer
    add_column :guests, :breakfast, :integer
    remove_column :guests, :meals
    add_column :kids, :needs_bed, :integer
  end
end
