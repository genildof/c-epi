json.array!(@cautelas) do |cautela|
  json.extract! cautela, :colaborador_id, :operador_id, :data, :status, :anexo, :comentarios
  json.url cautela_url(cautela, format: :json)
end
