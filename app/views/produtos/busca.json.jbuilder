json.array!(@produtos) do |result|
json.id result.id
json.value result.nome_pesquisa
json.valor_venda result.valr_unitario
end
