json.array!(@medios) do |medio|
  json.extract! medio, :id, :nombre, :nit, :dirección, :teléfono, :contacto_financiero, :contacto_comercial, :proveedore_id
  json.url medio_url(medio, format: :json)
end
