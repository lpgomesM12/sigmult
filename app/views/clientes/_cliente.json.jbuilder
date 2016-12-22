json.extract! cliente, :id, :nome_cliente, :cpf, :endereco_id, :data_exclusao, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)