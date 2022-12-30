class ChangeArrivalDateFromStringToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :guests, :arrival_date, 'integer USING CAST(arrival_date AS integer)'
  end
end
