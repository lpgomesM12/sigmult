json.extract! formapagamento, :id, :nome_formapagamento, :created_at, :updated_at
json.url formapagamento_url(formapagamento, format: :json)