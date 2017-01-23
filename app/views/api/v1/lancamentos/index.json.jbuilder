json.lancamentos @lancamentos do |i|
    json.id i.id
    json.nome_lancamento i.nome_lancamento
    json.data_vencimento(i.data_vencimento.strftime('%d-%m-%Y'))
    json.valr_lancamento number_to_currency(i.valr_lancamento , unit: "", separator: ",", delimiter: "").strip
    json.data_pagamento(i.data_pagamento.strftime('%d-%m-%Y'))
end
