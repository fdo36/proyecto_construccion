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

ActiveRecord::Schema.define(:version => 20130515034705) do

  create_table "access_rights", :force => true do |t|
    t.string   "model_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "role_id"
    t.string   "action"
  end

  create_table "communes", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.integer  "rut"
    t.string   "address"
    t.string   "city"
    t.string   "line_of_business"
    t.integer  "phone"
    t.string   "email"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "containers", :force => true do |t|
    t.string   "name"
    t.string   "tare"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "containers_producers", :id => false, :force => true do |t|
    t.integer "container_id"
    t.integer "producer_id"
  end

  add_index "containers_producers", ["container_id", "producer_id"], :name => "index_containers_producers_on_container_id_and_producer_id"
  add_index "containers_producers", ["producer_id", "container_id"], :name => "index_containers_producers_on_producer_id_and_container_id"

  create_table "destinations", :force => true do |t|
    t.string   "rut"
    t.string   "company_name"
    t.integer  "commune_id"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.text     "contact"
    t.boolean  "active"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "groupings", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groupings_producers", :id => false, :force => true do |t|
    t.integer "grouping_id"
    t.integer "producer_id"
  end

  add_index "groupings_producers", ["grouping_id", "producer_id"], :name => "index_groupings_producers_on_grouping_id_and_producer_id"
  add_index "groupings_producers", ["producer_id", "grouping_id"], :name => "index_groupings_producers_on_producer_id_and_grouping_id"

  create_table "kinds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "kinds_producers", :id => false, :force => true do |t|
    t.integer "kind_id"
    t.integer "producer_id"
  end

  add_index "kinds_producers", ["kind_id", "producer_id"], :name => "index_kinds_producers_on_kind_id_and_producer_id"
  add_index "kinds_producers", ["producer_id", "kind_id"], :name => "index_kinds_producers_on_producer_id_and_kind_id"

  create_table "producers", :force => true do |t|
    t.string   "rut"
    t.string   "company_name"
    t.string   "line_of_business"
    t.integer  "commune_id"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.text     "contact"
    t.string   "sag_code"
    t.boolean  "active"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "qualities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id"
  add_index "roles_users", ["user_id", "role_id"], :name => "index_roles_users_on_user_id_and_role_id"

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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "phone"
    t.boolean  "active"
    t.string   "name"
    t.string   "lastname"
    t.boolean  "gender"
    t.string   "secret_question"
    t.string   "secret_answer"
    t.boolean  "super_admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "varieties", :force => true do |t|
    t.string   "name"
    t.integer  "kind_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_foreign_key "communes", "regions", :name => "communes_region_id_fk"

  add_foreign_key "containers_producers", "containers", :name => "containers_producers_container_id_fk"
  add_foreign_key "containers_producers", "producers", :name => "containers_producers_producer_id_fk"

  add_foreign_key "destinations", "communes", :name => "destinations_commune_id_fk"

  add_foreign_key "groupings_producers", "groupings", :name => "groupings_producers_grouping_id_fk"
  add_foreign_key "groupings_producers", "producers", :name => "groupings_producers_producer_id_fk"

  add_foreign_key "kinds_producers", "kinds", :name => "kinds_producers_kind_id_fk"
  add_foreign_key "kinds_producers", "producers", :name => "kinds_producers_producer_id_fk"

  add_foreign_key "producers", "communes", :name => "producers_commune_id_fk"

  add_foreign_key "roles_users", "roles", :name => "roles_users_role_id_fk"
  add_foreign_key "roles_users", "users", :name => "roles_users_user_id_fk"

  add_foreign_key "varieties", "kinds", :name => "varieties_kind_id_fk"

end
