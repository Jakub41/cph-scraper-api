class CreateDepartures < ActiveRecord::Migration[5.2]
  def change
    create_table :departures do |t|
      t.time :time
      t.date :date
      t.time :delay
      t.string :airline
      t.string :destination
      t.string :flight_id
      t.string :gate
      t.string :terminal
      t.string :status

      t.timestamps
    end
  end
end
