json.extract! produto, :id, :nome_produto, :desc_observacao, :categoriaproduto_id, :data_exclusao, :qtd_estoqueminimo, :qtd_estoquemaximo, :nome_marca, :cod_barras, :valor_custo, :valor_venda, :desc_tamanho, :status, :peso_kilograma, :desc_unidademedida, :created_at, :updated_at
json.url produto_url(produto, format: :json)