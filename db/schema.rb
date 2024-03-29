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

ActiveRecord::Schema.define(:version => 20120519161021) do

  create_table "employers", :force => true do |t|
    t.string   "name"
    t.string   "position"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "company_name"
    t.string   "company_description"
    t.text     "company_address"
    t.integer  "location_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "slug"
    t.string   "url"
  end

  add_index "employers", ["slug"], :name => "index_employers_on_slug", :unique => true

  create_table "job_seekers", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "job_seekers", ["location_id"], :name => "index_user_profiles_on_location_id"

  create_table "job_seekers_technologies", :id => false, :force => true do |t|
    t.integer "job_seeker_id"
    t.integer "technology_id"
  end

  create_table "jobs", :force => true do |t|
    t.string   "title"
    t.text     "description",       :limit => 255
    t.date     "deadline"
    t.integer  "positions"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.float    "freedom"
    t.integer  "percentage"
    t.integer  "employer_id"
    t.boolean  "deadline_asap",                    :default => true
    t.text     "necessary_skills"
    t.text     "desired_qualities"
  end

  add_index "jobs", ["employer_id"], :name => "index_jobs_on_employer_id"

  create_table "jobs_technologies", :id => false, :force => true do |t|
    t.integer "job_id"
    t.integer "technology_id"
  end

  create_table "locations", :force => true do |t|
    t.decimal  "lat",            :precision => 15, :scale => 10
    t.decimal  "lng",            :precision => 15, :scale => 10
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "locatable_id"
    t.string   "locatable_type"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "technologies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "shortname"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "rolable_id"
    t.string   "rolable_type"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
