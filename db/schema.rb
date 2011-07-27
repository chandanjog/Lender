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

ActiveRecord::Schema.define(:version => 20110726141152) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "images", :force => true do |t|
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", :force => true do |t|
    t.decimal  "amount",                     :precision => 10, :scale => 0
    t.decimal  "rate_of_interest_per_annum", :precision => 10, :scale => 0
    t.integer  "number_of_installments"
    t.decimal  "emi",                        :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reference_number"
    t.string   "financer"
    t.text     "notes"
    t.boolean  "active"
    t.integer  "installment_term"
  end

  add_index "loans", ["reference_number"], :name => "loans_reference_number_index", :unique => true

  create_table "payments", :force => true do |t|
    t.decimal  "amount",     :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "loan_id"
    t.date     "date"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "village"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "loan_id"
    t.string   "role"
    t.string   "contact_number"
    t.string   "contact_number_secondary"
  end

  create_table "vehicles", :force => true do |t|
    t.string   "model"
    t.integer  "registration_number"
    t.string   "chassis_number"
    t.integer  "engine_number"
    t.string   "dealer"
    t.date     "insurance_date"
    t.string   "rto_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "loan_id"
  end

end
