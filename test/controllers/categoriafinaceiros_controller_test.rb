require 'test_helper'

class CategoriafinaceirosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoriafinaceiro = categoriafinaceiros(:one)
  end

  test "should get index" do
    get categoriafinaceiros_url
    assert_response :success
  end

  test "should get new" do
    get new_categoriafinaceiro_url
    assert_response :success
  end

  test "should create categoriafinaceiro" do
    assert_difference('Categoriafinaceiro.count') do
      post categoriafinaceiros_url, params: { categoriafinaceiro: { empresa_id: @categoriafinaceiro.empresa_id, nome_categoria: @categoriafinaceiro.nome_categoria } }
    end

    assert_redirected_to categoriafinaceiro_url(Categoriafinaceiro.last)
  end

  test "should show categoriafinaceiro" do
    get categoriafinaceiro_url(@categoriafinaceiro)
    assert_response :success
  end

  test "should get edit" do
    get edit_categoriafinaceiro_url(@categoriafinaceiro)
    assert_response :success
  end

  test "should update categoriafinaceiro" do
    patch categoriafinaceiro_url(@categoriafinaceiro), params: { categoriafinaceiro: { empresa_id: @categoriafinaceiro.empresa_id, nome_categoria: @categoriafinaceiro.nome_categoria } }
    assert_redirected_to categoriafinaceiro_url(@categoriafinaceiro)
  end

  test "should destroy categoriafinaceiro" do
    assert_difference('Categoriafinaceiro.count', -1) do
      delete categoriafinaceiro_url(@categoriafinaceiro)
    end

    assert_redirected_to categoriafinaceiros_url
  end
end
