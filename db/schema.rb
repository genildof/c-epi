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

ActiveRecord::Schema.define(version: 20131001012519) do

  create_table "cargos", force: true do |t|
    t.string   "nome"
    t.string   "periculosidade", default: "NAO", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cautelaitems", force: true do |t|
    t.integer  "material_id"
    t.integer  "cautela_id"
    t.string   "serial"
    t.date     "validade",    default: '2015-11-02'
    t.integer  "quantidade",  default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cautelaitems", ["cautela_id"], name: "index_cautelaitems_on_cautela_id"
  add_index "cautelaitems", ["material_id"], name: "index_cautelaitems_on_material_id"

  create_table "cautelas", force: true do |t|
    t.integer  "colaborador_id"
    t.integer  "user_id"
    t.date     "data"
    t.string   "status"
    t.string   "anexo"
    t.text     "comentarios"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cautelas", ["colaborador_id"], name: "index_cautelas_on_colaborador_id"
  add_index "cautelas", ["user_id"], name: "index_cautelas_on_user_id"

  create_table "cidades", force: true do |t|
    t.string   "nome"
    t.integer  "fabrica_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colaboradors", force: true do |t|
    t.string   "matricula"
    t.string   "nome"
    t.integer  "cargo_id"
    t.integer  "cidade_id"
    t.date     "admissao"
    t.string   "desligado",  default: "NAO"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colaboradors", ["cargo_id"], name: "index_colaboradors_on_cargo_id"
  add_index "colaboradors", ["cidade_id"], name: "index_colaboradors_on_cidade_id"

  create_table "fabricas", force: true do |t|
    t.string   "nome"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materials", force: true do |t|
    t.string   "tipo",       default: "EPI"
    t.string   "codigo"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password_digest"
    t.string   "profile"
    t.string   "email"
    t.string   "remember_token"
    t.integer  "cidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["cidade_id"], name: "index_users_on_cidade_id"

end
