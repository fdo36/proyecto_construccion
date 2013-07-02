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


ActiveRecord::Schema.define(:version => 20130701021007) do

  create_table "access_rights", :force => true do |t|
    t.string   "model_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "role_id"
    t.string   "action"
    t.integer  "company_id"
  end

  create_table "communes", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name",             :default => "", :null => false
    t.string   "address"
    t.string   "commune_id"
    t.string   "line_of_business"
    t.string   "email",            :default => "", :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "active"
    t.integer  "region_id"
    t.string   "rut"
    t.string   "phone"
  end

  create_table "containers", :force => true do |t|
    t.string   "name"
    t.float    "tare"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "containers_producers", :id => false, :force => true do |t|
    t.integer "container_id"
    t.integer "producer_id"
  end

  add_index "containers_producers", ["container_id", "producer_id"], :name => "index_containers_producers_on_container_id_and_producer_id"
  add_index "containers_producers", ["producer_id", "container_id"], :name => "index_containers_producers_on_producer_id_and_container_id"

  create_table "customs", :force => true do |t|
    t.string   "rut"
    t.string   "code"
    t.string   "line_of_business"
    t.string   "address"
    t.string   "location"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "company_id"
    t.integer  "user_id"
  end

  create_table "destinations", :force => true do |t|
    t.integer  "code"
    t.string   "rut"
    t.string   "name"
    t.integer  "commune_id"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.text     "contact"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "is_deleted"
    t.integer  "company_id"
  end

  create_table "dispatch_containers", :force => true do |t|
    t.integer  "dispatch_id"
    t.integer  "container_id"
    t.integer  "quality_id"
    t.integer  "variety_id"
    t.integer  "quantity"
    t.float    "gross_weight"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "dispatches", :force => true do |t|
    t.string   "code"
    t.integer  "destination_id"
    t.integer  "kind_id"
    t.datetime "dispatch_datetime"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "empty_packs_destination_moves", :force => true do |t|
    t.integer  "company_id"
    t.integer  "destination_id"
    t.integer  "pack_type_id"
    t.integer  "quantity"
    t.string   "pack_option"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "empty_packs_producer_moves", :force => true do |t|
    t.integer  "company_id"
    t.integer  "producer_id"
    t.integer  "pack_type_id"
    t.integer  "quantity"
    t.string   "pack_option"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "final_packing_pallets", :force => true do |t|
    t.integer  "kind_id"
    t.integer  "variety_id"
    t.integer  "quality_id"
    t.integer  "pack_packing_id"
    t.integer  "format_id"
    t.integer  "quantity"
    t.float    "net_weight"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "format_packings", :force => true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.float    "weight"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "frozen_tunnel_ios", :force => true do |t|
    t.integer  "order_number"
    t.integer  "tunnel_id"
    t.float    "tunnel_temperature"
    t.float    "packing_pallet_temperature"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "groupings", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "company_id"
  end

  create_table "groupings_producers", :force => true do |t|
    t.integer "grouping_id"
    t.integer "producer_id"
    t.string  "code"
  end

  add_index "groupings_producers", ["grouping_id", "producer_id"], :name => "index_groupings_producers_on_grouping_id_and_producer_id"
  add_index "groupings_producers", ["producer_id", "grouping_id"], :name => "index_groupings_producers_on_producer_id_and_grouping_id"

  create_table "kinds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "company_id"
  end

  create_table "kinds_producers", :id => false, :force => true do |t|
    t.integer "kind_id"
    t.integer "producer_id"
  end

  add_index "kinds_producers", ["kind_id", "producer_id"], :name => "index_kinds_producers_on_kind_id_and_producer_id"
  add_index "kinds_producers", ["producer_id", "kind_id"], :name => "index_kinds_producers_on_producer_id_and_kind_id"

  create_table "localities", :force => true do |t|
    t.string   "name"
    t.integer  "commune_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pack_group_dispatches", :force => true do |t|
    t.integer  "gross_weight"
    t.integer  "quantity"
    t.integer  "quality_id"
    t.integer  "variety_id"
    t.integer  "dispatch_id"
    t.integer  "pack_type_id"
    t.integer  "company_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "pack_group_receipts", :force => true do |t|
    t.integer  "price_per_unit"
    t.integer  "quantity"
    t.integer  "gross_weight"
    t.integer  "pack_type_id"
    t.integer  "variety_id"
    t.integer  "quality_id"
    t.integer  "receipt_id"
    t.integer  "company_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "pack_packings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pack_types", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "tare"
  end

  create_table "pack_types_producers", :id => false, :force => true do |t|
    t.integer "pack_type_id"
    t.integer "producer_id"
  end

  add_index "pack_types_producers", ["pack_type_id", "producer_id"], :name => "index_pack_types_producers_on_pack_type_id_and_producer_id"
  add_index "pack_types_producers", ["producer_id", "pack_type_id"], :name => "index_pack_types_producers_on_producer_id_and_pack_type_id"

  create_table "packing_pallets", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "quantity"
    t.float    "gross_weight"
    t.integer  "unit_price"
    t.float    "tare"
    t.float    "temperature"
    t.string   "pallet_code"
    t.integer  "pack_type_id"
  end

  create_table "packing_processes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pallet_finished_products", :force => true do |t|
    t.integer  "kind_id"
    t.integer  "variety"
    t.integer  "quality"
    t.integer  "pack_packing_id"
    t.integer  "format_packing_id"
    t.integer  "quantity"
    t.float    "net_weight"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "pallets", :force => true do |t|
    t.integer  "quantity"
    t.integer  "price_per_unit"
    t.integer  "gross_weight"
    t.integer  "tare"
    t.integer  "variety_id"
    t.integer  "quality_id"
    t.integer  "receipt_id"
    t.integer  "pack_type_id"
    t.integer  "company_id"
    t.integer  "dispatch_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "code"
  end

  create_table "producers", :force => true do |t|
    t.string   "rut"
    t.string   "name"
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
    t.boolean  "is_deleted"
    t.integer  "locality_id"
    t.integer  "code"
    t.integer  "company_id"
  end

  create_table "production_process_ios", :force => true do |t|
    t.integer  "order_number"
    t.float    "production_lines_number"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.string   "rut"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "commune"
    t.string   "contacto"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "qualities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "company_id"
  end

  create_table "receipt_containers", :force => true do |t|
    t.integer  "receipt_id"
    t.integer  "container_id"
    t.integer  "quality_id"
    t.integer  "variety_id"
    t.float    "price_kg"
    t.integer  "quantity"
    t.float    "gross_weight"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "receipt_packing_ios", :force => true do |t|
    t.integer  "producer_id"
    t.integer  "code"
    t.string   "pack_type"
    t.integer  "trazability_code"
    t.integer  "dispatch_guide_number"
    t.string   "comments"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "receipts", :force => true do |t|
    t.string   "code"
    t.integer  "producer_id"
    t.integer  "kind_id"
    t.datetime "receipt_datetime"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
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
    t.integer  "company_id"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id"
  add_index "roles_users", ["user_id", "role_id"], :name => "index_roles_users_on_user_id_and_role_id"

  create_table "seasons", :force => true do |t|
    t.date     "init_date"
    t.date     "end_date"
    t.integer  "kind_id"
    t.integer  "is_active"
    t.integer  "is_delete"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stabilization_chamber_ios", :force => true do |t|
    t.float    "temperature"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "subprocess_ios", :force => true do |t|
    t.integer  "packing_pallet_id"
    t.datetime "io_datetime"
    t.boolean  "direction"
    t.integer  "worker_id"
    t.integer  "subprocess_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "heir_id"
    t.string   "heir_type"
  end

  create_table "subprocesses", :force => true do |t|
    t.string   "name"
    t.integer  "process_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "supplies", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "minimum_stock"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "transit_chamber_ios", :force => true do |t|
    t.float    "temperature"
    t.integer  "order_number"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tunnels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "is_delete"
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "phone"
    t.boolean  "active"
    t.string   "name"
    t.string   "lastname"
    t.string   "secret_question"
    t.string   "secret_answer"
    t.boolean  "super_admin"
    t.integer  "company_id"
    t.string   "gender"
    t.string   "address"
    t.integer  "region_id"
    t.integer  "commune_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "varieties", :force => true do |t|
    t.string   "name"
    t.integer  "kind_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "company_id"
  end

  create_table "wash_chamber_ios", :force => true do |t|
    t.integer  "order_number"
    t.integer  "duration"
    t.float    "washing_lines"
    t.float    "total_neto"
    t.float    "total_cull"
    t.float    "total_waste"
    t.float    "total"
    t.float    "stadistics"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "wiki_page_versions", :force => true do |t|
    t.integer  "page_id",    :null => false
    t.integer  "updator_id"
    t.integer  "number"
    t.string   "comment"
    t.string   "path"
    t.string   "title"
    t.text     "content"
    t.datetime "updated_at"
  end

  add_index "wiki_page_versions", ["page_id"], :name => "index_wiki_page_versions_on_page_id"
  add_index "wiki_page_versions", ["updator_id"], :name => "index_wiki_page_versions_on_updator_id"

  create_table "wiki_pages", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "updator_id"
    t.string   "path"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "wiki_pages", ["creator_id"], :name => "index_wiki_pages_on_creator_id"
  add_index "wiki_pages", ["path"], :name => "index_wiki_pages_on_path", :unique => true

  create_table "workers", :force => true do |t|
    t.integer  "rut"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_foreign_key "communes", "regions", :name => "communes_region_id_fk"

  add_foreign_key "containers_producers", "containers", :name => "containers_producers_container_id_fk"
  add_foreign_key "containers_producers", "producers", :name => "containers_producers_producer_id_fk"

  add_foreign_key "destinations", "communes", :name => "destinations_commune_id_fk"

  add_foreign_key "dispatch_containers", "containers", :name => "dispatch_containers_container_id_fk"
  add_foreign_key "dispatch_containers", "dispatches", :name => "dispatch_containers_dispatch_id_fk"
  add_foreign_key "dispatch_containers", "qualities", :name => "dispatch_containers_quality_id_fk"
  add_foreign_key "dispatch_containers", "varieties", :name => "dispatch_containers_variety_id_fk"

  add_foreign_key "dispatches", "destinations", :name => "dispatches_destination_id_fk"
  add_foreign_key "dispatches", "kinds", :name => "dispatches_kind_id_fk"

  add_foreign_key "final_packing_pallets", "kinds", :name => "final_packing_pallets_kind_id_fk"
  add_foreign_key "final_packing_pallets", "qualities", :name => "final_packing_pallets_quality_id_fk"
  add_foreign_key "final_packing_pallets", "varieties", :name => "final_packing_pallets_variety_id_fk"

  add_foreign_key "groupings_producers", "groupings", :name => "groupings_producers_grouping_id_fk"
  add_foreign_key "groupings_producers", "producers", :name => "groupings_producers_producer_id_fk"

  add_foreign_key "kinds_producers", "kinds", :name => "kinds_producers_kind_id_fk"
  add_foreign_key "kinds_producers", "producers", :name => "kinds_producers_producer_id_fk"

  add_foreign_key "pack_group_receipts", "qualities", :name => "pack_group_receipts_quality_id_fk"
  add_foreign_key "pack_group_receipts", "receipts", :name => "pack_group_receipts_receipt_id_fk"
  add_foreign_key "pack_group_receipts", "varieties", :name => "pack_group_receipts_variety_id_fk"

  add_foreign_key "pack_types_producers", "pack_types", :name => "pack_types_producers_pack_type_id_fk"
  add_foreign_key "pack_types_producers", "producers", :name => "pack_types_producers_producer_id_fk"

  add_foreign_key "pallets", "qualities", :name => "pallets_quality_id_fk"
  add_foreign_key "pallets", "receipts", :name => "pallets_receipt_id_fk"
  add_foreign_key "pallets", "varieties", :name => "pallets_variety_id_fk"

  add_foreign_key "producers", "communes", :name => "producers_commune_id_fk"

  add_foreign_key "receipt_containers", "containers", :name => "receipt_containers_container_id_fk"
  add_foreign_key "receipt_containers", "qualities", :name => "receipt_containers_quality_id_fk"
  add_foreign_key "receipt_containers", "receipts", :name => "receipt_containers_receipt_id_fk"
  add_foreign_key "receipt_containers", "varieties", :name => "receipt_containers_variety_id_fk"

  add_foreign_key "receipts", "kinds", :name => "receipts_kind_id_fk"
  add_foreign_key "receipts", "producers", :name => "receipts_producer_id_fk"

  add_foreign_key "roles_users", "roles", :name => "roles_users_role_id_fk"
  add_foreign_key "roles_users", "users", :name => "roles_users_user_id_fk"

  add_foreign_key "seasons", "kinds", :name => "seasons_kind_id_fk"

  add_foreign_key "varieties", "kinds", :name => "varieties_kind_id_fk"

end
