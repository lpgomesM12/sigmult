json.extract! venda, :id, :cliente_id, :data_exclusao, :empresa_id, :valr_desconto, :valr_venda, :valr_total, :situacao, :formapagamento_id, :created_at, :updated_at
json.url venda_url(venda, format: :json)