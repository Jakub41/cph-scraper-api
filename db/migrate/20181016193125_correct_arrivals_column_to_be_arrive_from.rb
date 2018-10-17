class CorrectArrivalsColumnToBeArriveFrom < ActiveRecord::Migration[5.2]
  def change
    rename_column :arrivals_tables, :destination, :arriving_from
  end
end
