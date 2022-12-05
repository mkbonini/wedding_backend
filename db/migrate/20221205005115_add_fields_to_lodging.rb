class AddFieldsToLodging < ActiveRecord::Migration[5.2]
  def change
    add_column :lodgings, :title, :string
    add_column :lodgings, :image_url, :string
    add_column :lodgings, :color, :string
  end
end
