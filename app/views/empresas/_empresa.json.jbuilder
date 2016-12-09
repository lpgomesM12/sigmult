json.extract! empresa, :id, :nome_empresa, :endereco_id, :categoriaempresa_id, :cnpj, :nome_responsavel, :telefone1, :telefone2, :created_at, :updated_at
json.url empresa_url(empresa, format: :json)