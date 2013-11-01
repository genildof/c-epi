json.array!(@fabricas) do |fabrica|
  json.extract! fabrica, :nome, :estado
  json.url fabrica_url(fabrica, format: :json)
end
