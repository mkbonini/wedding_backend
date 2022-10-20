class CreatePlusOne < ActiveRecord::Migration[5.2]
  def change
    create_table :plus_ones do |t|
      t.string :name
      t.references :guest, foreign_key: true
      t.timestamps
    end
  end
end
