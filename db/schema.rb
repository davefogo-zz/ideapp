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

ActiveRecord::Schema.define(version: 20150422000935) do

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

  create_table "factura_items", force: :cascade do |t|
    t.integer  "factura_id"
    t.integer  "ordene_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "factura_items", ["factura_id"], name: "index_factura_items_on_factura_id"
  add_index "factura_items", ["ordene_id"], name: "index_factura_items_on_ordene_id"

  create_table "facturas", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.datetime "fecha_de_expedicion"
    t.date     "fecha_de_vencimiento"
    t.integer  "cliente_id"
  end

  add_index "facturas", ["cliente_id"], name: "index_facturas_on_cliente_id"

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
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "medio_id"
    t.integer  "aprobado_por_cliente"
    t.integer  "emision_certificada"
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

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
