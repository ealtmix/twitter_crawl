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

ActiveRecord::Schema.define(:version => 20130419164949) do

  create_table "Atlanta", :force => true do |t|
    t.text     "tweet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ChiTown", :force => true do |t|
    t.text     "tweet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "Denver", :force => true do |t|
    t.text     "tweet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "Florida", :force => true do |t|
    t.text     "tweet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "NewYork", :force => true do |t|
    t.text     "tweet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "SanFran", :force => true do |t|
    t.text     "tweet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "Sea_Van", :force => true do |t|
    t.text     "tweet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "Texas", :force => true do |t|
    t.text     "tweet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crawls", :force => true do |t|
    t.text     "tweet"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "user"
    t.float    "lat"
    t.float    "long"
  end

end
