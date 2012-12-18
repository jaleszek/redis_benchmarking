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

ActiveRecord::Schema.define(:version => 20121217155712) do

  create_table "definitions", :force => true do |t|
    t.string   "value",       :null => false
    t.text     "fakes",       :null => false
    t.integer  "word_id"
    t.integer  "language_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "definitions", ["language_id"], :name => "index_definitions_on_language_id"
  add_index "definitions", ["word_id"], :name => "index_definitions_on_word_id"

  create_table "language_translations", :force => true do |t|
    t.integer  "language_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "language_translations", ["language_id"], :name => "index_language_translations_on_language_id"
  add_index "language_translations", ["locale"], :name => "index_language_translations_on_locale"

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "languages", ["symbol"], :name => "index_languages_on_symbol"

  create_table "users", :force => true do |t|
    t.string   "email",                   :default => "",   :null => false
    t.string   "encrypted_password",      :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "active_mailing",          :default => true
    t.integer  "level",                   :default => 0,    :null => false
    t.integer  "words_language_id",       :default => 1,    :null => false
    t.integer  "definitions_language_id", :default => 2,    :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "words", :force => true do |t|
    t.string   "value",           :null => false
    t.text     "fakes",           :null => false
    t.integer  "occurrence",      :null => false
    t.integer  "rating",          :null => false
    t.integer  "language_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "root_word"
    t.string   "derivation_type"
  end

  add_index "words", ["language_id"], :name => "index_words_on_language_id"
  add_index "words", ["occurrence"], :name => "index_words_on_occurrence"
  add_index "words", ["value"], :name => "index_words_on_value", :unique => true

end
