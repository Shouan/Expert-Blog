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

ActiveRecord::Schema.define(:version => 20120506215706) do

  create_table "experts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "topics_of_interest"
    t.string   "expertise"
    t.string   "professional_bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",              :default => false
  end

  add_index "experts", ["email_address"], :name => "index_experts_on_email_address", :unique => true
  add_index "experts", ["remember_token"], :name => "index_experts_on_remember_token"

  create_table "posts", :force => true do |t|
    t.string   "content"
    t.integer  "expert_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
