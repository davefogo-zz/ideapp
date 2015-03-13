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

ActiveRecord::Schema.define(version: 20150304181344) do

  create_table "clientes", force: :cascade do |t|
    t.string   "nombre"
    t.string   "nit"
    t.string   "dirección_de_facturación"
    t.string   "teléfono"
    t.string   "tipo_de_cliente"
    t.string   "contacto_comercial"
    t.string   "contacto_facturación"
    t.integer  "cupo_de_crédito",          limit: 8
    t.integer  "colaboradore_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "clientes", ["colaboradore_id"], name: "index_clientes_on_colaboradore_id"

  create_table "colaboradores", force: :cascade do |t|
    t.string   "nombre"
    t.string   "cédula"
    t.string   "dirección"
    t.string   "teléfono_personal"
    t.string   "teléfono_empresa"
    t.string   "cargo"
    t.string   "departamento"
    t.string   "jefe_inmediato"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "medios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "nit"
    t.string   "dirección"
    t.string   "teléfono"
    t.string   "contacto_financiero"
    t.string   "contacto_comercial"
    t.integer  "proveedore_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "medios", ["proveedore_id"], name: "index_medios_on_proveedore_id"

  create_table "ordenes", force: :cascade do |t|
    t.datetime "fecha_orden"
    t.decimal  "medida"
    t.string   "unidad"
    t.integer  "costo_unidad"
    t.integer  "total"
    t.integer  "presupuesto_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "presupuesto_id"
  end

  add_index "ordenes", ["presupuesto_id"], name: "index_ordenes_on_presupuesto_id"

  create_table "presupuestos", force: :cascade do |t|
    t.datetime "fecha"
    t.string   "cliente"
    t.string   "nit"
    t.string   "dirección"
    t.string   "teléfono"
    t.string   "contacto_financiero"
    t.string   "contacto_comercial"
    t.string   "ejecutivo"
    t.string   "agencia"
    t.string   "nit_agencia"
    t.string   "titulo"
    t.string   "producto"
    t.integer  "colaboradore_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "presupuestos", ["colaboradore_id"], name: "index_presupuestos_on_colaboradore_id"

  create_table "proveedores", force: :cascade do |t|
    t.string   "nombre"
    t.string   "nit"
    t.string   "dirección"
    t.string   "teléfono"
    t.string   "contacto_financiero"
    t.string   "contacto_comercial"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
