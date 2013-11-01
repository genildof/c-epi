json.array!(@colaboradors) do |colaborador|
  json.extract! colaborador, :matricula, :nome, :cargo_id, :cidade_id, :admissao, :desligamento
  json.url colaborador_url(colaborador, format: :json)
end
