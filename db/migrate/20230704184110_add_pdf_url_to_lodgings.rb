class AddPdfUrlToLodgings < ActiveRecord::Migration[5.2]
  def change
    add_column :lodgings, :pdf_url, :string
  end
end
