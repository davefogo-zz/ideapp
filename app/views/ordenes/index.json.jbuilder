json.array!(@ordenes) do |ordene|
  json.extract! ordene, :id, :fecha_orden, :medida, :unidad, :costo_unidad, :total, :presupuesto_id
  json.url ordene_url(ordene, format: :json)
end
