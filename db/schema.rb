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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151031214651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.string  "url"
    t.integer "photo_id"
    t.index ["photo_id"], name: "index_images_on_photo_id", using: :btree
  end

  create_table "listings", force: :cascade do |t|
    t.string   "uuid"
    t.boolean  "active"
    t.string   "name"
    t.string   "email"
    t.string   "description"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "lat"
    t.string   "lng"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "interest_point_id"
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "listing_id"
    t.index ["listing_id"], name: "index_photos_on_listing_id", using: :btree
  end

  create_table "tag_associations", force: :cascade do |t|
    t.integer "listing_id"
    t.integer "tag_id"
    t.index ["listing_id"], name: "index_tag_associations_on_listing_id", using: :btree
    t.index ["tag_id"], name: "index_tag_associations_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string "label"
  end

  create_table "thumbs", force: :cascade do |t|
    t.string  "url"
    t.integer "image_id"
    t.index ["image_id"], name: "index_thumbs_on_image_id", using: :btree
  end

  add_foreign_key "images", "photos"
  add_foreign_key "photos", "listings"
  add_foreign_key "tag_associations", "listings"
  add_foreign_key "tag_associations", "tags"
  add_foreign_key "thumbs", "images"
end
