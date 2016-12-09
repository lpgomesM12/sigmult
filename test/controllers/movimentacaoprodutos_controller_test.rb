require 'test_helper'

class MovimentacaoprodutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movimentacaoproduto = movimentacaoprodutos(:one)
  end

  test "should get index" do
    get movimentacaoprodutos_url
    assert_response :success
  end

  test "should get new" do
    get new_movimentacaoproduto_url
    assert_response :success
  end

  test "should create movimentacaoproduto" do
    assert_difference('Movimentacaoproduto.count') do
      post movimentacaoprodutos_url, params: { movimentacaoproduto: { data_exclusao: @movimentacaoproduto.data_exclusao, produto_id: @movimentacaoproduto.produto_id, qtd_produto: @movimentacaoproduto.qtd_produto, tipo_movimentacao: @movimentacaoproduto.tipo_movimentacao, valor_movimentacao: @movimentacaoproduto.valor_movimentacao } }
    end

    assert_redirected_to movimentacaoproduto_url(Movimentacaoproduto.last)
  end

  test "should show movimentacaoproduto" do
    get movimentacaoproduto_url(@movimentacaoproduto)
    assert_response :success
  end

  test "should get edit" do
    get edit_movimentacaoproduto_url(@movimentacaoproduto)
    assert_response :success
  end

  test "should update movimentacaoproduto" do
    patch movimentacaoproduto_url(@movimentacaoproduto), params: { movimentacaoproduto: { data_exclusao: @movimentacaoproduto.data_exclusao, produto_id: @movimentacaoproduto.produto_id, qtd_produto: @movimentacaoproduto.qtd_produto, tipo_movimentacao: @movimentacaoproduto.tipo_movimentacao, valor_movimentacao: @movimentacaoproduto.valor_movimentacao } }
    assert_redirected_to movimentacaoproduto_url(@movimentacaoproduto)
  end

  test "should destroy movimentacaoproduto" do
    assert_difference('Movimentacaoproduto.count', -1) do
      delete movimentacaoproduto_url(@movimentacaoproduto)
    end

    assert_redirected_to movimentacaoprodutos_url
  end
end
