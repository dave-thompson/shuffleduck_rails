# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100111113203) do

  create_table "deck_details", :force => true do |t|
    t.integer  "deck_id"
    t.string   "xml_string"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "decks", :force => true do |t|
    t.integer  "creator_account_id"
    t.string   "user_visible_id"
    t.string   "title"
    t.string   "cover_xml_string"
    t.datetime "last_saved_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_cards"
  end

end
