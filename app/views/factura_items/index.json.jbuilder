json.array!(@factura_items) do |factura_item|
  json.extract! factura_item, :id, :factura_id, :ordene_id
  json.url factura_item_url(factura_item, format: :json)
end
