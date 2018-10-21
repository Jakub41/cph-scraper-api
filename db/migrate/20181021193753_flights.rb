class Flights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :is_arrival, null: false
      t.date :date, null: false
      t.string :time, null: false
      t.string :expected, default: ''
      t.string :airline, null: false
      t.string :flight_no, null: false
      t.string :gate, default: ''
      t.string :terminal, default: ''
      t.string :status, default: ''
      t.string :destination, null: true
      t.string :arriving_from, null: true
    end
  end
end
