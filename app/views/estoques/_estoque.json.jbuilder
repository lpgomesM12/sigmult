json.extract! estoque, :id, :qtd_produto, :produto_id, :created_at, :updated_at
json.url estoque_url(estoque, format: :json)