class ChangeDeparturesTableToDepartures < ActiveRecord::Migration[5.2]
  def change
    rename_table :departures_tables, :departures
  end
end
