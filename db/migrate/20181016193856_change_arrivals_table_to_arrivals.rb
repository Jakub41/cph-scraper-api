class ChangeArrivalsTableToArrivals < ActiveRecord::Migration[5.2]
  def change
    rename_table :arrivals_tables, :arrivals
  end
end
