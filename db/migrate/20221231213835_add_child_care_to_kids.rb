class AddChildCareToKids < ActiveRecord::Migration[5.2]
  def change
    add_column :kids, :child_care, :integer
  end
end
