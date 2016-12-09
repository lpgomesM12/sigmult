require 'test_helper'

class ProdutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @produto = produtos(:one)
  end

  test "should get index" do
    get produtos_url
    assert_response :success
  end

  test "should get new" do
    get new_produto_url
    assert_response :success
  end

  test "should create produto" do
    assert_difference('Produto.count') do
      post produtos_url, params: { produto: { categoriaproduto_id: @produto.categoriaproduto_id, cod_barras: @produto.cod_barras, data_exclusao: @produto.data_exclusao, desc_observacao: @produto.desc_observacao, desc_tamanho: @produto.desc_tamanho, desc_unidademedida: @produto.desc_unidademedida, nome_marca: @produto.nome_marca, nome_produto: @produto.nome_produto, peso_kilograma: @produto.peso_kilograma, qtd_estoquemaximo: @produto.qtd_estoquemaximo, qtd_estoqueminimo: @produto.qtd_estoqueminimo, status: @produto.status, valor_custo: @produto.valor_custo, valor_venda: @produto.valor_venda } }
    end

    assert_redirected_to produto_url(Produto.last)
  end

  test "should show produto" do
    get produto_url(@produto)
    assert_response :success
  end

  test "should get edit" do
    get edit_produto_url(@produto)
    assert_response :success
  end

  test "should update produto" do
    patch produto_url(@produto), params: { produto: { categoriaproduto_id: @produto.categoriaproduto_id, cod_barras: @produto.cod_barras, data_exclusao: @produto.data_exclusao, desc_observacao: @produto.desc_observacao, desc_tamanho: @produto.desc_tamanho, desc_unidademedida: @produto.desc_unidademedida, nome_marca: @produto.nome_marca, nome_produto: @produto.nome_produto, peso_kilograma: @produto.peso_kilograma, qtd_estoquemaximo: @produto.qtd_estoquemaximo, qtd_estoqueminimo: @produto.qtd_estoqueminimo, status: @produto.status, valor_custo: @produto.valor_custo, valor_venda: @produto.valor_venda } }
    assert_redirected_to produto_url(@produto)
  end

  test "should destroy produto" do
    assert_difference('Produto.count', -1) do
      delete produto_url(@produto)
    end

    assert_redirected_to produtos_url
  end
end
