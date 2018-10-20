# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Arrival.create!(time: "10:00", date: "2018-10-14", airline: "airline1", arriving_from: "loc1", flight_no: "ABCD", gate: "g1", terminal: "t1", status: "OK")
Departure.create!(time: "11:00", date: "2018-10-14", airline: "airline2", destination: "loc2", flight_no: "XYZ", gate: "g2", terminal: "t2", status: "OK")
