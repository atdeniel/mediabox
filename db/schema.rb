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

ActiveRecord::Schema.define(version: 20131018031139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: true do |t|
    t.string   "nombre"
    t.date     "fecha"
    t.string   "descripcion"
    t.string   "lugar"
    t.string   "imagen"
    t.string   "privacidad"
    t.integer  "fk_usuario"
    t.string   "activo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "amigos", force: true do |t|
    t.integer  "fk_usuario1"
    t.integer  "fk_usuario2"
    t.string   "status"
    t.date     "fecha"
    t.string   "leido"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comentarios", force: true do |t|
    t.string   "coment"
    t.integer  "nivel"
    t.string   "notificacion"
    t.integer  "fk_album"
    t.integer  "fk_usuario"
    t.integer  "fk_comentario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "megusta", force: true do |t|
    t.string   "tipo"
    t.integer  "fk_usuario"
    t.integer  "fk_comentario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "multimedia", force: true do |t|
    t.string   "nombre"
    t.date     "fecha"
    t.string   "descripcion"
    t.string   "lugar"
    t.string   "api"
    t.string   "tipo"
    t.integer  "fk_album"
    t.string   "activo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "description"
    t.string   "image"
    t.string   "phone"
    t.string   "email"
    t.string   "privacity"
    t.string   "favorite"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

end
