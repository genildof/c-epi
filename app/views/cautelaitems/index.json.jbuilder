json.array!(@cautelaitems) do |cautelaitem|
  json.extract! cautelaitem, :material_id, :cautela_id, :serial, :validade, :quantidade
  json.url cautelaitem_url(cautelaitem, format: :json)
end
