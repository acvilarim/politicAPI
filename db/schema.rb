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

ActiveRecord::Schema.define(:version => 20130702144101) do

  create_table "mandatos", :force => true do |t|
    t.string   "tipo"
    t.string   "partido"
    t.string   "uf"
    t.string   "nome_parlamentar"
    t.integer  "ano"
    t.string   "codigo"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "politico_id"
  end

  create_table "orgaos", :force => true do |t|
    t.integer  "codigo"
    t.string   "sigla"
    t.string   "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "orgaos", ["codigo"], :name => "index_orgaos_on_codigo"

  create_table "politicos", :force => true do |t|
    t.string   "nome"
    t.string   "sexo"
    t.string   "foto"
    t.string   "email"
    t.date     "data_nascimento"
    t.string   "uf_nascimento"
    t.string   "midia_social"
    t.string   "contato"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
