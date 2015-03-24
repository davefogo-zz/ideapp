json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nombre, :nit, :dirección_de_facturación, :teléfono, :tipo_de_cliente, :contacto_comercial, :contacto_facturación, :cupo_de_crédito, :colaboradore_id
  json.url cliente_url(cliente, format: :json)
end
