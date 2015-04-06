json.array!(@facturas) do |factura|
  json.extract! factura, :id, :factura_de_venta
  json.url factura_url(factura, format: :json)
end
