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

ActiveRecord::Schema.define(:version => 20120806233239) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories_companies", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "company_id"
  end

  create_table "companies", :force => true do |t|
    t.string   "name",              :null => false
    t.text     "description"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.text     "formatted_address"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "phone_number"
    t.string   "website"
    t.string   "slug"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "companies_customers", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "customer_id"
  end

  create_table "customers", :force => true do |t|
    t.integer  "company_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "day_phone_number"
    t.string   "alt_phone_number"
    t.string   "email"
    t.string   "street_address"
    t.string   "apartment"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.date     "last_service_date"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "default_review_topics", :force => true do |t|
    t.string   "title",      :null => false
    t.integer  "sort_order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "email_templates", :force => true do |t|
    t.string   "category"
    t.string   "from_email"
    t.text     "subject"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "facebook_profiles", :force => true do |t|
    t.integer  "customer_id"
    t.string   "profile_id"
    t.string   "access_token"
    t.string   "state"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "review_id"
    t.integer  "customer_id"
    t.text     "question"
    t.text     "reviewer_answer"
    t.text     "company_answer"
    t.string   "state"
    t.string   "email_key"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
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

  create_table "review_ratings", :force => true do |t|
    t.integer  "review_id"
    t.float    "review_topic_id", :default => 0.0, :null => false
    t.float    "score"
    t.string   "ip_address"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "review_topics", :force => true do |t|
    t.integer  "company_id"
    t.integer  "default_review_topic_id"
    t.string   "state"
    t.float    "average_score"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "reviews", :force => true do |t|
    t.integer  "company_id"
    t.integer  "customer_id"
    t.text     "summary"
    t.text     "content"
    t.float    "average_score",  :default => 0.0
    t.date     "written_date"
    t.string   "state"
    t.string   "ip_address"
    t.string   "reviewer_state"
    t.string   "reviewer_city"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "sales_teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "social_network_pages", :force => true do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.string   "page_id",             :null => false
    t.string   "access_token",        :null => false
    t.string   "access_token_secret"
    t.string   "page_name"
    t.string   "category"
    t.string   "type"
    t.string   "state"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "stats", :force => true do |t|
    t.integer  "company_id"
    t.date     "month_id"
    t.integer  "logo_views_count",          :default => 0
    t.integer  "pages_view_count",          :default => 0
    t.integer  "new_reviews_count",         :default => 0
    t.integer  "total_reviews_count",       :default => 0
    t.integer  "reviews_view_count",        :default => 0
    t.float    "view_conversion",           :default => 0.0
    t.float    "new_reviews_average_score", :default => 0.0
    t.float    "approval_rating",           :default => 0.0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "company_id"
    t.datetime "last_checked_at"
    t.string   "state"
    t.text     "note"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
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

  create_table "users", :force => true do |t|
    t.integer  "company_id"
    t.string   "email",                                  :null => false
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.string   "old_password"
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token",                    :null => false
    t.string   "perishable_token",                       :null => false
    t.string   "type",                                   :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "state",                                  :null => false
    t.boolean  "terms_accepted",      :default => false
    t.integer  "login_count",         :default => 0
    t.datetime "last_login_at"
    t.string   "last_login_ip"
    t.integer  "sales_team_id"
    t.boolean  "manager",             :default => false
    t.boolean  "primary_contact",     :default => false
    t.boolean  "accepts_terms",       :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

end
