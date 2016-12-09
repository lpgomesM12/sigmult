json.extract! categoriaempresa, :id, :nome_categoria, :desc_descricao, :created_at, :updated_at
json.url categoriaempresa_url(categoriaempresa, format: :json)