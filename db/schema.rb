# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_01_30_104621) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "albums", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_albums_on_post_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "country"
    t.string "region"
    t.string "district"
    t.integer "loctype"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "home_team_id", null: false
    t.bigint "visitor_team_id", null: false
    t.integer "home_team_goal"
    t.integer "visitor_team_goal"
    t.bigint "tournament_id", null: false
    t.bigint "stadium_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stage"
    t.bigint "post_id", null: false
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["post_id"], name: "index_matches_on_post_id"
    t.index ["stadium_id"], name: "index_matches_on_stadium_id"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
    t.index ["visitor_team_id"], name: "index_matches_on_visitor_team_id"
  end

  create_table "post_about_stadia", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "stadium_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_about_stadia_on_post_id"
    t.index ["stadium_id"], name: "index_post_about_stadia_on_stadium_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id", null: false
    t.date "postdate"
    t.integer "posttype"
    t.index ["location_id"], name: "index_posts_on_location_id"
  end

  create_table "stadia", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id", null: false
    t.index ["location_id"], name: "index_stadia_on_location_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "represent"
    t.string "teamtype"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.string "subname"
    t.string "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "albums", "posts"
  add_foreign_key "matches", "posts"
  add_foreign_key "matches", "stadia"
  add_foreign_key "matches", "teams", column: "home_team_id"
  add_foreign_key "matches", "teams", column: "visitor_team_id"
  add_foreign_key "matches", "tournaments"
  add_foreign_key "post_about_stadia", "posts"
  add_foreign_key "post_about_stadia", "stadia"
  add_foreign_key "posts", "locations"
  add_foreign_key "stadia", "locations"
end
