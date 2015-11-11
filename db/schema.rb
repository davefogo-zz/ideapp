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

ActiveRecord::Schema.define(version: 20151111000054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activo_fijos", force: :cascade do |t|
    t.date     "fecha_de_compra"
    t.integer  "gasto_id"
    t.string   "vida_util"
    t.integer  "importe",         limit: 8
    t.string   "depreciacion"
    t.string   "descripcion"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "activo_fijos", ["gasto_id"], name: "index_activo_fijos_on_gasto_id", using: :btree

  create_table "ajustes", force: :cascade do |t|
    t.date     "fecha"
    t.integer  "cliente_id"
    t.integer  "proveedore_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "descripcion"
  end

  add_index "ajustes", ["cliente_id"], name: "index_ajustes_on_cliente_id", using: :btree
  add_index "ajustes", ["proveedore_id"], name: "index_ajustes_on_proveedore_id", using: :btree

  create_table "cargos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "departamento_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "cargos", ["departamento_id"], name: "index_cargos_on_departamento_id", using: :btree

  create_table "clases", force: :cascade do |t|
    t.integer  "clase"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "nombre"
    t.string   "contacto_comercial"
    t.integer  "colaboradore_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "direccion_de_facturacion"
    t.string   "cupo_de_credito"
    t.string   "contacto_facturacion"
    t.string   "telefono"
    t.string   "ciudad"
    t.string   "codigo_postal"
    t.string   "pais"
    t.string   "tipo_de_documento"
    t.string   "tipo_de_persona"
    t.string   "tipo_de_responsable"
    t.string   "actividad"
    t.string   "notas"
    t.string   "numero_de_documento"
  end

  add_index "clientes", ["colaboradore_id"], name: "index_clientes_on_colaboradore_id", using: :btree

  create_table "colaboradores", force: :cascade do |t|
    t.string   "nombre"
    t.string   "jefe_inmediato"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "cedula"
    t.string   "telefono_empresa"
    t.string   "telefono_personal"
    t.string   "direccion"
    t.integer  "user_id"
    t.integer  "departamento_id"
    t.integer  "cargo_id"
  end

  add_index "colaboradores", ["cargo_id"], name: "index_colaboradores_on_cargo_id", using: :btree
  add_index "colaboradores", ["departamento_id"], name: "index_colaboradores_on_departamento_id", using: :btree
  add_index "colaboradores", ["user_id"], name: "index_colaboradores_on_user_id", using: :btree

  create_table "cuenta_pucs", force: :cascade do |t|
    t.integer  "cuenta"
    t.string   "descripcion"
    t.integer  "grupo_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cuenta_pucs", ["grupo_id"], name: "index_cuenta_pucs_on_grupo_id", using: :btree

  create_table "departamentos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "jefe"
    t.integer  "colaboradore_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "departamentos", ["colaboradore_id"], name: "index_departamentos_on_colaboradore_id", using: :btree

  create_table "escalas", force: :cascade do |t|
    t.decimal  "escala"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factura_items", force: :cascade do |t|
    t.integer  "factura_id"
    t.integer  "ordene_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.date     "fecha_orden"
    t.string   "unidad"
    t.integer  "costo_unidad",       limit: 8
    t.integer  "medio_id"
    t.boolean  "facturar"
    t.integer  "cantidad"
    t.string   "ubicacion"
    t.decimal  "descuento"
    t.integer  "iva",                limit: 8
    t.integer  "subtotal",           limit: 8
    t.boolean  "facturar_proveedor"
    t.boolean  "sin_iva"
    t.integer  "presupuesto_id"
    t.integer  "valor",              limit: 8
    t.integer  "total",              limit: 8
    t.string   "cobro_proveedor"
    t.integer  "subcuenta_puc_id"
    t.string   "notas"
    t.integer  "ret_iva",            limit: 8
    t.integer  "ret_ica",            limit: 8
    t.integer  "ret_fte",            limit: 8
  end

  add_index "factura_items", ["factura_id"], name: "index_factura_items_on_factura_id", using: :btree
  add_index "factura_items", ["medio_id"], name: "index_factura_items_on_medio_id", using: :btree
  add_index "factura_items", ["ordene_id"], name: "index_factura_items_on_ordene_id", using: :btree
  add_index "factura_items", ["subcuenta_puc_id"], name: "index_factura_items_on_subcuenta_puc_id", using: :btree

  create_table "factura_proveedors", force: :cascade do |t|
    t.date     "fecha_recepcion"
    t.integer  "ordene_id"
    t.integer  "proveedore_id"
    t.integer  "importe",              limit: 8
    t.boolean  "devolucion"
    t.integer  "iva",                  limit: 8
    t.date     "fecha_vencimiento"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "importe_pronto_pago",  limit: 8
    t.string   "numero_de_factura"
    t.integer  "factura_proveedor_id"
    t.integer  "subcuenta_puc_id"
    t.integer  "pago_item_id"
    t.integer  "total",                limit: 8
  end

  add_index "factura_proveedors", ["factura_proveedor_id"], name: "index_factura_proveedors_on_factura_proveedor_id", using: :btree
  add_index "factura_proveedors", ["ordene_id"], name: "index_factura_proveedors_on_ordene_id", using: :btree
  add_index "factura_proveedors", ["pago_item_id"], name: "index_factura_proveedors_on_pago_item_id", using: :btree
  add_index "factura_proveedors", ["proveedore_id"], name: "index_factura_proveedors_on_proveedore_id", using: :btree
  add_index "factura_proveedors", ["subcuenta_puc_id"], name: "index_factura_proveedors_on_subcuenta_puc_id", using: :btree

  create_table "facturas", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.date     "fecha_de_expedicion"
    t.date     "fecha_de_vencimiento"
    t.integer  "cliente_id"
    t.integer  "presupuesto_id"
    t.integer  "total",                limit: 8
    t.boolean  "facturar"
    t.string   "estado"
  end

  add_index "facturas", ["cliente_id"], name: "index_facturas_on_cliente_id", using: :btree
  add_index "facturas", ["presupuesto_id"], name: "index_facturas_on_presupuesto_id", using: :btree

  create_table "gastos", force: :cascade do |t|
    t.date     "fecha_recepcion"
    t.integer  "proveedore_id"
    t.integer  "importe",                   limit: 8
    t.integer  "iva",                       limit: 8
    t.date     "fecha_de_vencimiento"
    t.integer  "subcuenta_puc_id"
    t.boolean  "asignar_a_cliente"
    t.integer  "cliente_id"
    t.boolean  "compra_de_activo"
    t.integer  "user_id"
    t.integer  "pago_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "ret_fte"
    t.decimal  "ret_ica"
    t.boolean  "iva_teo"
    t.integer  "importe_fte",               limit: 8
    t.integer  "importe_ica",               limit: 8
    t.integer  "importe_iva_teo",           limit: 8
    t.boolean  "ret_iva"
    t.integer  "importe_ret_iva",           limit: 8
    t.boolean  "gasto_pago"
    t.string   "numero_de_factura"
    t.integer  "importe_menos_retenciones", limit: 8
  end

  add_index "gastos", ["cliente_id"], name: "index_gastos_on_cliente_id", using: :btree
  add_index "gastos", ["pago_id"], name: "index_gastos_on_pago_id", using: :btree
  add_index "gastos", ["proveedore_id"], name: "index_gastos_on_proveedore_id", using: :btree
  add_index "gastos", ["subcuenta_puc_id"], name: "index_gastos_on_subcuenta_puc_id", using: :btree
  add_index "gastos", ["user_id"], name: "index_gastos_on_user_id", using: :btree

  create_table "grupos", force: :cascade do |t|
    t.integer  "grupo"
    t.string   "descripcion"
    t.integer  "clase_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "grupos", ["clase_id"], name: "index_grupos_on_clase_id", using: :btree

  create_table "incentivos", force: :cascade do |t|
    t.string   "tipo_de_volumen"
    t.string   "cobro"
    t.integer  "medio_id"
    t.integer  "ordene_id"
    t.integer  "pago_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "valor_incentivo", limit: 8
  end

  add_index "incentivos", ["medio_id"], name: "index_incentivos_on_medio_id", using: :btree
  add_index "incentivos", ["ordene_id"], name: "index_incentivos_on_ordene_id", using: :btree
  add_index "incentivos", ["pago_id"], name: "index_incentivos_on_pago_id", using: :btree

  create_table "medios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "contacto_financiero"
    t.integer  "proveedore_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "ordene_id"
    t.string   "tipo_de_volumen"
    t.string   "cobro"
    t.integer  "presupuesto_id"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "zona"
    t.string   "tipo_de_medio"
    t.integer  "escala_id"
    t.integer  "iva"
    t.string   "notas"
  end

  add_index "medios", ["escala_id"], name: "index_medios_on_escala_id", using: :btree
  add_index "medios", ["ordene_id"], name: "index_medios_on_ordene_id", using: :btree
  add_index "medios", ["presupuesto_id"], name: "index_medios_on_presupuesto_id", using: :btree
  add_index "medios", ["proveedore_id"], name: "index_medios_on_proveedore_id", using: :btree

  create_table "orden_anuladas", force: :cascade do |t|
    t.date     "fecha_orden"
    t.integer  "orden_reemplazada"
    t.string   "unidad"
    t.integer  "costo_unidad"
    t.integer  "presupuesto"
    t.integer  "cantidad"
    t.decimal  "descuento"
    t.integer  "iva"
    t.integer  "total"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "ordenes", force: :cascade do |t|
    t.date     "fecha_orden"
    t.string   "unidad"
    t.integer  "costo_unidad",         limit: 8
    t.integer  "presupuesto_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "factura_id"
    t.integer  "cantidad"
    t.string   "cobertura"
    t.string   "referencia_preventa"
    t.string   "ubicacion"
    t.decimal  "descuento"
    t.string   "formato"
    t.integer  "duracion"
    t.string   "notas"
    t.integer  "cm"
    t.integer  "col"
    t.string   "franja"
    t.integer  "subtotal",             limit: 8
    t.boolean  "aprobado_por_cliente"
    t.boolean  "emision_certificada"
    t.integer  "iva",                  limit: 8
    t.integer  "total",                limit: 8
    t.date     "facturado"
    t.integer  "incentivo",            limit: 8
    t.integer  "medio_id"
  end

  add_index "ordenes", ["factura_id"], name: "index_ordenes_on_factura_id", using: :btree
  add_index "ordenes", ["medio_id"], name: "index_ordenes_on_medio_id", using: :btree
  add_index "ordenes", ["presupuesto_id"], name: "index_ordenes_on_presupuesto_id", using: :btree

  create_table "pago_items", force: :cascade do |t|
    t.integer  "pago_id"
    t.integer  "factura_proveedor_id"
    t.integer  "importe",              limit: 8
    t.string   "forma_de_pago"
    t.boolean  "gasto"
    t.string   "banco"
    t.string   "numero_de_cheque"
    t.integer  "importe_pronto_pago",  limit: 8
    t.integer  "subcuenta_puc_id"
    t.integer  "incentivo_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "gasto_id"
  end

  add_index "pago_items", ["factura_proveedor_id"], name: "index_pago_items_on_factura_proveedor_id", using: :btree
  add_index "pago_items", ["gasto_id"], name: "index_pago_items_on_gasto_id", using: :btree
  add_index "pago_items", ["incentivo_id"], name: "index_pago_items_on_incentivo_id", using: :btree
  add_index "pago_items", ["pago_id"], name: "index_pago_items_on_pago_id", using: :btree
  add_index "pago_items", ["subcuenta_puc_id"], name: "index_pago_items_on_subcuenta_puc_id", using: :btree

  create_table "pagos", force: :cascade do |t|
    t.date     "fecha"
    t.integer  "factura_proveedor_id"
    t.integer  "proveedore_id"
    t.boolean  "gasto"
    t.boolean  "pagar"
    t.integer  "importe_pronto_pago",  limit: 8
    t.integer  "subtotal",             limit: 8
    t.integer  "total",                limit: 8
    t.integer  "incentivo_total",      limit: 8
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "pagos", ["factura_proveedor_id"], name: "index_pagos_on_factura_proveedor_id", using: :btree
  add_index "pagos", ["proveedore_id"], name: "index_pagos_on_proveedore_id", using: :btree

  create_table "presupuestos", force: :cascade do |t|
    t.date     "fecha"
    t.string   "titulo"
    t.string   "producto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cliente_id"
  end

  add_index "presupuestos", ["cliente_id"], name: "index_presupuestos_on_cliente_id", using: :btree

  create_table "proveedores", force: :cascade do |t|
    t.string   "nombre"
    t.string   "contacto_financiero"
    t.string   "contacto_comercial"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.decimal  "pronto_pago"
    t.integer  "dias_pronto_pago"
    t.boolean  "gasto"
    t.string   "tipo_de_documento"
    t.string   "tipo_de_responsable"
    t.string   "tipo_de_persona"
    t.string   "tipo_de_retencion_iva"
    t.string   "codigo_ciiu"
    t.string   "numero_de_documento"
    t.decimal  "porcentaje_pronto_pago"
    t.decimal  "tipo_de_retencion_ica"
  end

  create_table "recibo_de_cajas", force: :cascade do |t|
    t.date     "fecha"
    t.integer  "cliente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recibo_de_cajas", ["cliente_id"], name: "index_recibo_de_cajas_on_cliente_id", using: :btree

  create_table "recibo_items", force: :cascade do |t|
    t.integer  "recibo_de_caja_id"
    t.integer  "factura_id"
    t.string   "forma_de_pago"
    t.string   "numero_de_cheque"
    t.integer  "importe",           limit: 8
    t.date     "fecha"
    t.integer  "subcuenta_puc_id"
    t.string   "banco"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "recibo_items", ["factura_id"], name: "index_recibo_items_on_factura_id", using: :btree
  add_index "recibo_items", ["recibo_de_caja_id"], name: "index_recibo_items_on_recibo_de_caja_id", using: :btree
  add_index "recibo_items", ["subcuenta_puc_id"], name: "index_recibo_items_on_subcuenta_puc_id", using: :btree

  create_table "subcuenta_pucs", force: :cascade do |t|
    t.string   "subcuenta"
    t.string   "descripcion"
    t.integer  "cuenta_puc_id"
    t.string   "moneda"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "subcuenta_pucs", ["cuenta_puc_id"], name: "index_subcuenta_pucs_on_cuenta_puc_id", using: :btree

  create_table "transaccions", force: :cascade do |t|
    t.date     "fecha"
    t.integer  "cliente_id"
    t.integer  "debito",               limit: 8
    t.integer  "credito",              limit: 8
    t.integer  "presupuesto_id"
    t.integer  "subcuenta_puc_id"
    t.integer  "factura_item_id"
    t.integer  "pago_id"
    t.integer  "recibo_de_caja_id"
    t.integer  "gasto_id"
    t.integer  "factura_proveedor_id"
    t.integer  "proveedore_id"
    t.integer  "ajuste_id"
    t.integer  "recibo_item_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "transaccions", ["ajuste_id"], name: "index_transaccions_on_ajuste_id", using: :btree
  add_index "transaccions", ["cliente_id"], name: "index_transaccions_on_cliente_id", using: :btree
  add_index "transaccions", ["factura_item_id"], name: "index_transaccions_on_factura_item_id", using: :btree
  add_index "transaccions", ["factura_proveedor_id"], name: "index_transaccions_on_factura_proveedor_id", using: :btree
  add_index "transaccions", ["gasto_id"], name: "index_transaccions_on_gasto_id", using: :btree
  add_index "transaccions", ["pago_id"], name: "index_transaccions_on_pago_id", using: :btree
  add_index "transaccions", ["presupuesto_id"], name: "index_transaccions_on_presupuesto_id", using: :btree
  add_index "transaccions", ["proveedore_id"], name: "index_transaccions_on_proveedore_id", using: :btree
  add_index "transaccions", ["recibo_de_caja_id"], name: "index_transaccions_on_recibo_de_caja_id", using: :btree
  add_index "transaccions", ["recibo_item_id"], name: "index_transaccions_on_recibo_item_id", using: :btree
  add_index "transaccions", ["subcuenta_puc_id"], name: "index_transaccions_on_subcuenta_puc_id", using: :btree

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
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "activo_fijos", "gastos"
  add_foreign_key "ajustes", "clientes"
  add_foreign_key "ajustes", "proveedores"
  add_foreign_key "cargos", "departamentos"
  add_foreign_key "clientes", "colaboradores"
  add_foreign_key "colaboradores", "cargos"
  add_foreign_key "colaboradores", "departamentos"
  add_foreign_key "colaboradores", "users"
  add_foreign_key "cuenta_pucs", "grupos"
  add_foreign_key "departamentos", "colaboradores"
  add_foreign_key "factura_items", "facturas"
  add_foreign_key "factura_items", "medios"
  add_foreign_key "factura_items", "ordenes"
  add_foreign_key "factura_items", "subcuenta_pucs"
  add_foreign_key "factura_proveedors", "factura_proveedors"
  add_foreign_key "factura_proveedors", "ordenes"
  add_foreign_key "factura_proveedors", "pago_items"
  add_foreign_key "factura_proveedors", "proveedores"
  add_foreign_key "factura_proveedors", "subcuenta_pucs"
  add_foreign_key "facturas", "clientes"
  add_foreign_key "facturas", "presupuestos"
  add_foreign_key "gastos", "clientes"
  add_foreign_key "gastos", "pagos"
  add_foreign_key "gastos", "proveedores"
  add_foreign_key "gastos", "subcuenta_pucs"
  add_foreign_key "gastos", "users"
  add_foreign_key "grupos", "clases"
  add_foreign_key "incentivos", "medios"
  add_foreign_key "incentivos", "ordenes"
  add_foreign_key "incentivos", "pagos"
  add_foreign_key "medios", "escalas"
  add_foreign_key "medios", "ordenes"
  add_foreign_key "medios", "presupuestos"
  add_foreign_key "medios", "proveedores"
  add_foreign_key "ordenes", "facturas"
  add_foreign_key "ordenes", "medios"
  add_foreign_key "ordenes", "presupuestos"
  add_foreign_key "pago_items", "factura_proveedors"
  add_foreign_key "pago_items", "gastos"
  add_foreign_key "pago_items", "incentivos"
  add_foreign_key "pago_items", "pagos"
  add_foreign_key "pago_items", "subcuenta_pucs"
  add_foreign_key "pagos", "factura_proveedors"
  add_foreign_key "pagos", "proveedores"
  add_foreign_key "presupuestos", "clientes"
  add_foreign_key "recibo_de_cajas", "clientes"
  add_foreign_key "recibo_items", "facturas"
  add_foreign_key "recibo_items", "recibo_de_cajas"
  add_foreign_key "recibo_items", "subcuenta_pucs"
  add_foreign_key "subcuenta_pucs", "cuenta_pucs"
  add_foreign_key "transaccions", "ajustes"
  add_foreign_key "transaccions", "clientes"
  add_foreign_key "transaccions", "factura_items"
  add_foreign_key "transaccions", "factura_proveedors"
  add_foreign_key "transaccions", "gastos"
  add_foreign_key "transaccions", "pagos"
  add_foreign_key "transaccions", "presupuestos"
  add_foreign_key "transaccions", "proveedores"
  add_foreign_key "transaccions", "recibo_de_cajas"
  add_foreign_key "transaccions", "recibo_items"
  add_foreign_key "transaccions", "subcuenta_pucs"
end
