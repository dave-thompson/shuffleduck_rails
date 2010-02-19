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

ActiveRecord::Schema.define(:version => 20100219155939) do

  create_table "deck_details", :force => true do |t|
    t.integer  "deck_id"
    t.text     "xml_string"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "decks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "user_visible_id"
    t.string   "title"
    t.text     "cover_xml_string"
    t.datetime "last_saved_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_cards"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                             :null => false
    t.integer  "age_at_signup",                     :null => false
    t.string   "username",                          :null => false
    t.string   "crypted_password",                  :null => false
    t.string   "password_salt",                     :null => false
    t.string   "persistence_token",                 :null => false
    t.string   "perishable_token"
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"
  add_index "users", ["username"], :name => "index_users_on_username"

end
