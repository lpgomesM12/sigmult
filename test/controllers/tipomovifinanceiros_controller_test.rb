require 'test_helper'

class TipomovifinanceirosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipomovifinanceiro = tipomovifinanceiros(:one)
  end

  test "should get index" do
    get tipomovifinanceiros_url
    assert_response :success
  end

  test "should get new" do
    get new_tipomovifinanceiro_url
    assert_response :success
  end

  test "should create tipomovifinanceiro" do
    assert_difference('Tipomovifinanceiro.count') do
      post tipomovifinanceiros_url, params: { tipomovifinanceiro: { nome_movimento: @tipomovifinanceiro.nome_movimento } }
    end

    assert_redirected_to tipomovifinanceiro_url(Tipomovifinanceiro.last)
  end

  test "should show tipomovifinanceiro" do
    get tipomovifinanceiro_url(@tipomovifinanceiro)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipomovifinanceiro_url(@tipomovifinanceiro)
    assert_response :success
  end

  test "should update tipomovifinanceiro" do
    patch tipomovifinanceiro_url(@tipomovifinanceiro), params: { tipomovifinanceiro: { nome_movimento: @tipomovifinanceiro.nome_movimento } }
    assert_redirected_to tipomovifinanceiro_url(@tipomovifinanceiro)
  end

  test "should destroy tipomovifinanceiro" do
    assert_difference('Tipomovifinanceiro.count', -1) do
      delete tipomovifinanceiro_url(@tipomovifinanceiro)
    end

    assert_redirected_to tipomovifinanceiros_url
  end
end
