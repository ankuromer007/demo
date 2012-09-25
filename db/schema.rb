# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120925125557) do

  create_table "item_users", :force => true do |t|
    t.integer  "item_id",                                   :null => false
    t.integer  "user_id",                                   :null => false
    t.decimal  "bid_price",  :precision => 10, :scale => 2, :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "item_users", ["bid_price"], :name => "index_item_users_on_bid_price"
  add_index "item_users", ["item_id", "user_id"], :name => "index_item_users_on_item_id_and_user_id"
  add_index "item_users", ["user_id"], :name => "item_users_user_id_fk"

  create_table "items", :force => true do |t|
    t.string   "name",                                                                                       :null => false
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "base_price",                                                                                 :null => false
    t.datetime "deadline",                                                                                   :null => false
    t.boolean  "status",                                                                  :default => false, :null => false
    t.integer  "user_id",                                                                                    :null => false
    t.datetime "created_at",                                                                                 :null => false
    t.datetime "updated_at",                                                                                 :null => false
    t.binary   "image_file",         :limit => 2147483647
    t.binary   "image_small_file",   :limit => 2147483647
    t.binary   "image_thumb_file",   :limit => 2147483647
    t.decimal  "max_bid_price",                            :precision => 10, :scale => 2, :default => 0.0
    t.integer  "buyer_id",                                                                :default => 0
  end

  add_index "items", ["deadline"], :name => "index_items_on_deadline"
  add_index "items", ["name", "base_price", "deadline"], :name => "index_items_on_name_and_base_price_and_deadline", :unique => true
  add_index "items", ["name"], :name => "index_items_on_name"
  add_index "items", ["status"], :name => "index_items_on_status"
  add_index "items", ["user_id"], :name => "items_user_id_fk"

  create_table "users", :force => true do |t|
    t.string   "email",                                        :default => "", :null => false
    t.string   "encrypted_password",                           :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
    t.string   "name"
    t.string   "contact_no"
    t.text     "address"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.binary   "avatar_file",            :limit => 2147483647
    t.binary   "avatar_small_file",      :limit => 2147483647
    t.binary   "avatar_thumb_file",      :limit => 2147483647
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  add_foreign_key "item_users", "items", :name => "item_users_item_id_fk"
  add_foreign_key "item_users", "users", :name => "item_users_user_id_fk"

  add_foreign_key "items", "users", :name => "items_user_id_fk"

end
