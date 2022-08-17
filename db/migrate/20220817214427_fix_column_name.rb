class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :lodgings, :type, :lodging_type
  end
end
