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

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2022_10_01_104614) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "photo_id", null: false
    t.bigint "album_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_bookmarks_on_album_id"
    t.index ["photo_id"], name: "index_bookmarks_on_photo_id"
=======
ActiveRecord::Schema[7.0].define(version: 2022_09_27_115241) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "collection_id"
    t.bigint "photo_id"
    t.index ["collection_id"], name: "index_bookmarks_on_collection_id"
    t.index ["photo_id"], name: "index_bookmarks_on_photo_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "photo_id"
    t.index ["photo_id"], name: "index_collections_on_photo_id"
>>>>>>> dbcd9e0bb25eb181491298d43efad4bdd80eefe9
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
<<<<<<< HEAD
=======
    t.text "description"
>>>>>>> dbcd9e0bb25eb181491298d43efad4bdd80eefe9
    t.string "film"
    t.string "camera"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
=======
    t.bigint "collection_id"
    t.index ["collection_id"], name: "index_photos_on_collection_id"
>>>>>>> dbcd9e0bb25eb181491298d43efad4bdd80eefe9
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

<<<<<<< HEAD
  add_foreign_key "bookmarks", "albums"
  add_foreign_key "bookmarks", "photos"
=======
  add_foreign_key "bookmarks", "collections"
  add_foreign_key "bookmarks", "photos"
  add_foreign_key "collections", "photos"
  add_foreign_key "photos", "collections"
>>>>>>> dbcd9e0bb25eb181491298d43efad4bdd80eefe9
end
