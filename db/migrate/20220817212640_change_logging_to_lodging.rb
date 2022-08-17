class ChangeLoggingToLodging < ActiveRecord::Migration[5.2]
  def change
    rename_table :loggings, :lodgings
    rename_column :guests, :logging_id, :lodging_id
  end
end
