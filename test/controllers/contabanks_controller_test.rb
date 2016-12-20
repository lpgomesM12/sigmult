require 'test_helper'

class ContabanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contabank = contabanks(:one)
  end

  test "should get index" do
    get contabanks_url
    assert_response :success
  end

  test "should get new" do
    get new_contabank_url
    assert_response :success
  end

  test "should create contabank" do
    assert_difference('Contabank.count') do
      post contabanks_url, params: { contabank: { data_exclusao: @contabank.data_exclusao, empresa_id: @contabank.empresa_id, nome_banco: @contabank.nome_banco, nome_conta: @contabank.nome_conta, numr_agencia: @contabank.numr_agencia, numr_conta: @contabank.numr_conta } }
    end

    assert_redirected_to contabank_url(Contabank.last)
  end

  test "should show contabank" do
    get contabank_url(@contabank)
    assert_response :success
  end

  test "should get edit" do
    get edit_contabank_url(@contabank)
    assert_response :success
  end

  test "should update contabank" do
    patch contabank_url(@contabank), params: { contabank: { data_exclusao: @contabank.data_exclusao, empresa_id: @contabank.empresa_id, nome_banco: @contabank.nome_banco, nome_conta: @contabank.nome_conta, numr_agencia: @contabank.numr_agencia, numr_conta: @contabank.numr_conta } }
    assert_redirected_to contabank_url(@contabank)
  end

  test "should destroy contabank" do
    assert_difference('Contabank.count', -1) do
      delete contabank_url(@contabank)
    end

    assert_redirected_to contabanks_url
  end
end
