json.array!(@cidades) do |cidade|
  json.extract! cidade, :nome, :fabrica_id
  json.url cidade_url(cidade, format: :json)
end
