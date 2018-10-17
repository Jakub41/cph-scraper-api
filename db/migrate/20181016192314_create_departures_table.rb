class CreateDeparturesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :departures_tables do |t|
      t.string :time
      t.date :date
      t.string :expected
      t.string :airline
      t.string :destination
      t.string :flight_no
      t.string :gate
      t.string :terminal
      t.string :status
    end
  end
end
