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

ActiveRecord::Schema.define(:version => 20120720183900) do

  create_table "facebook_profiles", :force => true do |t|
    t.integer  "customer_id"
    t.string   "profile_id"
    t.string   "access_token"
    t.string   "state"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "replies", :force => true do |t|
    t.integer  "review_id"
    t.integer  "customer_id"
    t.date     "written_date"
    t.text     "content"
    t.string   "state"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "reviews", :force => true do |t|
    t.integer  "company_id"
    t.integer  "customer_id"
    t.text     "summary"
    t.text     "content"
    t.date     "written_date"
    t.string   "state"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "social_network_pages", :force => true do |t|
    t.integer  "company_id"
    t.string   "page_id",             :null => false
    t.string   "access_token",        :null => false
    t.string   "access_token_secret"
    t.string   "page_name"
    t.string   "type"
    t.string   "state"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "syndication_posts", :force => true do |t|
    t.integer  "social_network_page_id"
    t.integer  "review_id"
    t.integer  "attempts"
    t.string   "state"
    t.text     "notes"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

end
