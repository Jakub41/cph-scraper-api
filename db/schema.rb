# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_21_211537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flights", force: :cascade do |t|
    t.integer "is_arrival", null: false
    t.date "date", null: false
    t.string "time", null: false
    t.string "expected", default: ""
    t.string "airline", null: false
    t.string "flight_no", null: false
    t.string "gate", default: ""
    t.string "terminal", default: ""
    t.string "status", default: ""
    t.string "destination"
    t.string "arriving_from"
  end

end
