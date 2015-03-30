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

ActiveRecord::Schema.define(version: 20150330174555) do

  create_table "clientes", force: :cascade do |t|
    t.string   "nombre"
    t.string   "nit"
    t.string   "tipo_de_cliente"
    t.string   "contacto_comercial"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "direccion_de_facturacion"
    t.string   "cupo_de_credito"
    t.string   "contacto_facturacion"
    t.string   "telefono"
    t.integer  "colaboradore_id"
  end

  add_index "clientes", ["colaboradore_id"], name: "index_clientes_on_colaboradore_id"

  create_table "colaboradores", force: :cascade do |t|
    t.string   "nombre"
    t.string   "cargo"
    t.string   "departamento"
    t.string   "jefe_inmediato"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "cedula"
    t.string   "telefono_empresa"
    t.string   "telefono_personal"
    t.string   "direccion"
  end

  create_table "medios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "nit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "proveedore_id"
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
    t.integer  "medio_id"
  end

  add_index "ordenes", ["medio_id"], name: "index_ordenes_on_medio_id"
  add_index "ordenes", ["presupuesto_id"], name: "index_ordenes_on_presupuesto_id"

  create_table "presupuestos", force: :cascade do |t|
    t.datetime "fecha"
    t.string   "titulo"
    t.string   "producto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cliente_id"
  end

  add_index "presupuestos", ["cliente_id"], name: "index_presupuestos_on_cliente_id"

  create_table "proveedores", force: :cascade do |t|
    t.string   "nombre"
    t.string   "nit"
    t.string   "contacto_financiero"
    t.string   "contacto_comercial"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "telefono"
    t.string   "direccion"
  end

end
