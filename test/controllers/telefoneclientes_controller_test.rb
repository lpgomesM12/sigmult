require 'test_helper'

class TelefoneclientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telefonecliente = telefoneclientes(:one)
  end

  test "should get index" do
    get telefoneclientes_url
    assert_response :success
  end

  test "should get new" do
    get new_telefonecliente_url
    assert_response :success
  end

  test "should create telefonecliente" do
    assert_difference('Telefonecliente.count') do
      post telefoneclientes_url, params: { telefonecliente: { cliente_id: @telefonecliente.cliente_id, desc_telefone: @telefonecliente.desc_telefone, tipo_telefone: @telefonecliente.tipo_telefone } }
    end

    assert_redirected_to telefonecliente_url(Telefonecliente.last)
  end

  test "should show telefonecliente" do
    get telefonecliente_url(@telefonecliente)
    assert_response :success
  end

  test "should get edit" do
    get edit_telefonecliente_url(@telefonecliente)
    assert_response :success
  end

  test "should update telefonecliente" do
    patch telefonecliente_url(@telefonecliente), params: { telefonecliente: { cliente_id: @telefonecliente.cliente_id, desc_telefone: @telefonecliente.desc_telefone, tipo_telefone: @telefonecliente.tipo_telefone } }
    assert_redirected_to telefonecliente_url(@telefonecliente)
  end

  test "should destroy telefonecliente" do
    assert_difference('Telefonecliente.count', -1) do
      delete telefonecliente_url(@telefonecliente)
    end

    assert_redirected_to telefoneclientes_url
  end
end
