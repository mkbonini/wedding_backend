class CreateLoggings < ActiveRecord::Migration[5.2]
  def change
    create_table :loggings do |t|
      t.string :name
      t.integer :type
      t.integer :capacity
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
