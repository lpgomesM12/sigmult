require 'test_helper'

class CategoriaprodutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoriaproduto = categoriaprodutos(:one)
  end

  test "should get index" do
    get categoriaprodutos_url
    assert_response :success
  end

  test "should get new" do
    get new_categoriaproduto_url
    assert_response :success
  end

  test "should create categoriaproduto" do
    assert_difference('Categoriaproduto.count') do
      post categoriaprodutos_url, params: { categoriaproduto: { nome_categoria: @categoriaproduto.nome_categoria } }
    end

    assert_redirected_to categoriaproduto_url(Categoriaproduto.last)
  end

  test "should show categoriaproduto" do
    get categoriaproduto_url(@categoriaproduto)
    assert_response :success
  end

  test "should get edit" do
    get edit_categoriaproduto_url(@categoriaproduto)
    assert_response :success
  end

  test "should update categoriaproduto" do
    patch categoriaproduto_url(@categoriaproduto), params: { categoriaproduto: { nome_categoria: @categoriaproduto.nome_categoria } }
    assert_redirected_to categoriaproduto_url(@categoriaproduto)
  end

  test "should destroy categoriaproduto" do
    assert_difference('Categoriaproduto.count', -1) do
      delete categoriaproduto_url(@categoriaproduto)
    end

    assert_redirected_to categoriaprodutos_url
  end
end
