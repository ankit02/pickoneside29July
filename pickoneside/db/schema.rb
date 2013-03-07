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

ActiveRecord::Schema.define(:version => 20130307111013) do

  create_table "categories", :force => true do |t|
    t.string   "topic"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "war_id"
    t.integer  "user_id"
  end

  add_index "comments", ["user_id"], :name => "comments_user_id_fk"
  add_index "comments", ["war_id"], :name => "comments_war_id_fk"

  create_table "hits", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "war_id"
  end

  add_index "hits", ["user_id"], :name => "hits_user_id_fk"
  add_index "hits", ["war_id"], :name => "hits_war_id_fk"

  create_table "options", :force => true do |t|
    t.string   "option"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "war_id"
  end

  add_index "options", ["war_id"], :name => "options_war_id_fk"

  create_table "users", :force => true do |t|
    t.string   "username",         :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "votings", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "option_id"
    t.integer  "user_id"
  end

  add_index "votings", ["option_id"], :name => "votings_option_id_fk"
  add_index "votings", ["user_id"], :name => "votings_user_id_fk"

  create_table "wars", :force => true do |t|
    t.string   "topic"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
    t.integer  "category_id"
  end

  add_index "wars", ["category_id"], :name => "wars_category_id_fk"

  add_foreign_key "comments", "users", :name => "comments_user_id_fk"
  add_foreign_key "comments", "wars", :name => "comments_war_id_fk"

  add_foreign_key "hits", "users", :name => "hits_user_id_fk"
  add_foreign_key "hits", "wars", :name => "hits_war_id_fk"

  add_foreign_key "options", "wars", :name => "options_war_id_fk"

  add_foreign_key "votings", "options", :name => "votings_option_id_fk"
  add_foreign_key "votings", "users", :name => "votings_user_id_fk"

  add_foreign_key "wars", "categories", :name => "wars_category_id_fk"

end
