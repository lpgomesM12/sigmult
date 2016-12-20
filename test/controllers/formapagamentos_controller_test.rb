require 'test_helper'

class FormapagamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formapagamento = formapagamentos(:one)
  end

  test "should get index" do
    get formapagamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_formapagamento_url
    assert_response :success
  end

  test "should create formapagamento" do
    assert_difference('Formapagamento.count') do
      post formapagamentos_url, params: { formapagamento: { nome_formapagamento: @formapagamento.nome_formapagamento } }
    end

    assert_redirected_to formapagamento_url(Formapagamento.last)
  end

  test "should show formapagamento" do
    get formapagamento_url(@formapagamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_formapagamento_url(@formapagamento)
    assert_response :success
  end

  test "should update formapagamento" do
    patch formapagamento_url(@formapagamento), params: { formapagamento: { nome_formapagamento: @formapagamento.nome_formapagamento } }
    assert_redirected_to formapagamento_url(@formapagamento)
  end

  test "should destroy formapagamento" do
    assert_difference('Formapagamento.count', -1) do
      delete formapagamento_url(@formapagamento)
    end

    assert_redirected_to formapagamentos_url
  end
end
