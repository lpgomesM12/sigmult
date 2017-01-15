require 'test_helper'

class LancamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lancamento = lancamentos(:one)
  end

  test "should get index" do
    get lancamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_lancamento_url
    assert_response :success
  end

  test "should create lancamento" do
    assert_difference('Lancamento.count') do
      post lancamentos_url, params: { lancamento: { categoriafinaceiro_id: @lancamento.categoriafinaceiro_id, data_exclusao: @lancamento.data_exclusao, data_pagamento: @lancamento.data_pagamento, data_vencimento: @lancamento.data_vencimento, empresa_id: @lancamento.empresa_id, flag_pago: @lancamento.flag_pago, formapagamento_id: @lancamento.formapagamento_id, fornecedor_id: @lancamento.fornecedor_id, nome_lancamento: @lancamento.nome_lancamento, numr_parcela: @lancamento.numr_parcela, numr_recorrencia: @lancamento.numr_recorrencia, numr_referenciparcela: @lancamento.numr_referenciparcela, situacao: @lancamento.situacao, tipo_lancamento: @lancamento.tipo_lancamento, valr_desconto: @lancamento.valr_desconto, valr_juros: @lancamento.valr_juros, valr_lancamento: @lancamento.valr_lancamento } }
    end

    assert_redirected_to lancamento_url(Lancamento.last)
  end

  test "should show lancamento" do
    get lancamento_url(@lancamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_lancamento_url(@lancamento)
    assert_response :success
  end

  test "should update lancamento" do
    patch lancamento_url(@lancamento), params: { lancamento: { categoriafinaceiro_id: @lancamento.categoriafinaceiro_id, data_exclusao: @lancamento.data_exclusao, data_pagamento: @lancamento.data_pagamento, data_vencimento: @lancamento.data_vencimento, empresa_id: @lancamento.empresa_id, flag_pago: @lancamento.flag_pago, formapagamento_id: @lancamento.formapagamento_id, fornecedor_id: @lancamento.fornecedor_id, nome_lancamento: @lancamento.nome_lancamento, numr_parcela: @lancamento.numr_parcela, numr_recorrencia: @lancamento.numr_recorrencia, numr_referenciparcela: @lancamento.numr_referenciparcela, situacao: @lancamento.situacao, tipo_lancamento: @lancamento.tipo_lancamento, valr_desconto: @lancamento.valr_desconto, valr_juros: @lancamento.valr_juros, valr_lancamento: @lancamento.valr_lancamento } }
    assert_redirected_to lancamento_url(@lancamento)
  end

  test "should destroy lancamento" do
    assert_difference('Lancamento.count', -1) do
      delete lancamento_url(@lancamento)
    end

    assert_redirected_to lancamentos_url
  end
end
