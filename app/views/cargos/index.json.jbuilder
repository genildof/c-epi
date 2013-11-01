json.array!(@cargos) do |cargo|
  json.extract! cargo, :nome, :periculosidade
  json.url cargo_url(cargo, format: :json)
end
