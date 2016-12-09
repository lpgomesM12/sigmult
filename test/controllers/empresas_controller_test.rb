require 'test_helper'

class EmpresasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empresa = empresas(:one)
  end

  test "should get index" do
    get empresas_url
    assert_response :success
  end

  test "should get new" do
    get new_empresa_url
    assert_response :success
  end

  test "should create empresa" do
    assert_difference('Empresa.count') do
      post empresas_url, params: { empresa: { categoriaempresa_id: @empresa.categoriaempresa_id, cnpj: @empresa.cnpj, endereco_id: @empresa.endereco_id, nome_empresa: @empresa.nome_empresa, nome_responsavel: @empresa.nome_responsavel, telefone1: @empresa.telefone1, telefone2: @empresa.telefone2 } }
    end

    assert_redirected_to empresa_url(Empresa.last)
  end

  test "should show empresa" do
    get empresa_url(@empresa)
    assert_response :success
  end

  test "should get edit" do
    get edit_empresa_url(@empresa)
    assert_response :success
  end

  test "should update empresa" do
    patch empresa_url(@empresa), params: { empresa: { categoriaempresa_id: @empresa.categoriaempresa_id, cnpj: @empresa.cnpj, endereco_id: @empresa.endereco_id, nome_empresa: @empresa.nome_empresa, nome_responsavel: @empresa.nome_responsavel, telefone1: @empresa.telefone1, telefone2: @empresa.telefone2 } }
    assert_redirected_to empresa_url(@empresa)
  end

  test "should destroy empresa" do
    assert_difference('Empresa.count', -1) do
      delete empresa_url(@empresa)
    end

    assert_redirected_to empresas_url
  end
end
