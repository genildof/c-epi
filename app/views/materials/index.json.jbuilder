json.array!(@materials) do |material|
  json.extract! material, :codigo, :nome
  json.url material_url(material, format: :json)
end
