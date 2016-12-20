require 'test_helper'

class UnidademedidasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unidademedida = unidademedidas(:one)
  end

  test "should get index" do
    get unidademedidas_url
    assert_response :success
  end

  test "should get new" do
    get new_unidademedida_url
    assert_response :success
  end

  test "should create unidademedida" do
    assert_difference('Unidademedida.count') do
      post unidademedidas_url, params: { unidademedida: { empresa_id: @unidademedida.empresa_id, nome_unidade: @unidademedida.nome_unidade } }
    end

    assert_redirected_to unidademedida_url(Unidademedida.last)
  end

  test "should show unidademedida" do
    get unidademedida_url(@unidademedida)
    assert_response :success
  end

  test "should get edit" do
    get edit_unidademedida_url(@unidademedida)
    assert_response :success
  end

  test "should update unidademedida" do
    patch unidademedida_url(@unidademedida), params: { unidademedida: { empresa_id: @unidademedida.empresa_id, nome_unidade: @unidademedida.nome_unidade } }
    assert_redirected_to unidademedida_url(@unidademedida)
  end

  test "should destroy unidademedida" do
    assert_difference('Unidademedida.count', -1) do
      delete unidademedida_url(@unidademedida)
    end

    assert_redirected_to unidademedidas_url
  end
end
