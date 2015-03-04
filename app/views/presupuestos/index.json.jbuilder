json.array!(@presupuestos) do |presupuesto|
  json.extract! presupuesto, :id, :fecha, :cliente, :nit, :dirección, :teléfono, :contacto_financiero, :contacto_comercial, :ejecutivo, :agencia, :nit_agencia, :titulo, :producto, :colaboradore_id
  json.url presupuesto_url(presupuesto, format: :json)
end
