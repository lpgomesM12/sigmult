require 'test_helper'

class CategoriaempresasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoriaempresa = categoriaempresas(:one)
  end

  test "should get index" do
    get categoriaempresas_url
    assert_response :success
  end

  test "should get new" do
    get new_categoriaempresa_url
    assert_response :success
  end

  test "should create categoriaempresa" do
    assert_difference('Categoriaempresa.count') do
      post categoriaempresas_url, params: { categoriaempresa: { desc_descricao: @categoriaempresa.desc_descricao, nome_categoria: @categoriaempresa.nome_categoria } }
    end

    assert_redirected_to categoriaempresa_url(Categoriaempresa.last)
  end

  test "should show categoriaempresa" do
    get categoriaempresa_url(@categoriaempresa)
    assert_response :success
  end

  test "should get edit" do
    get edit_categoriaempresa_url(@categoriaempresa)
    assert_response :success
  end

  test "should update categoriaempresa" do
    patch categoriaempresa_url(@categoriaempresa), params: { categoriaempresa: { desc_descricao: @categoriaempresa.desc_descricao, nome_categoria: @categoriaempresa.nome_categoria } }
    assert_redirected_to categoriaempresa_url(@categoriaempresa)
  end

  test "should destroy categoriaempresa" do
    assert_difference('Categoriaempresa.count', -1) do
      delete categoriaempresa_url(@categoriaempresa)
    end

    assert_redirected_to categoriaempresas_url
  end
end
