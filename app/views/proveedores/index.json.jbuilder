json.array!(@proveedores) do |proveedore|
  json.extract! proveedore, :id, :nombre, :nit, :dirección, :teléfono, :contacto_financiero, :contacto_comercial
  json.url proveedore_url(proveedore, format: :json)
end
