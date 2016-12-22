json.array!(@produtos) do |result|
json.id result.id
json.value result.nome_produto
json.valor_venda result.valr_unitario 
end
