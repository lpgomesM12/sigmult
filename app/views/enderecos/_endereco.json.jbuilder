json.extract! endereco, :id, :endereco, :cep, :complemento, :cidade_id, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)