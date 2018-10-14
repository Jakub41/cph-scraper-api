class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.time :arrival_time
      t.date :date
      t.time :delay
      t.string :airline
      t.string :from
      t.string :flight_id
      t.string :gate
      t.string :terminal
      t.string :status

      t.timestamps
    end
  end
end
