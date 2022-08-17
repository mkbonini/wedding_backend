class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :rsvp
      t.string :diet
      t.text :meals
      t.integer :payment_method
      t.string :arrival_date
      t.integer :age
      t.integer :plus_ones
      t.string :comments
      t.references :logging, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
