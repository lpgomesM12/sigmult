json.extract! movimentacaoproduto, :id, :qtd_produto, :tipo_movimentacao, :valor_movimentacao, :produto_id, :data_exclusao, :created_at, :updated_at
json.url movimentacaoproduto_url(movimentacaoproduto, format: :json)