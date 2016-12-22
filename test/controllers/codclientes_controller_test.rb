require 'test_helper'

class CodclientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @codcliente = codclientes(:one)
  end

  test "should get index" do
    get codclientes_url
    assert_response :success
  end

  test "should get new" do
    get new_codcliente_url
    assert_response :success
  end

  test "should create codcliente" do
    assert_difference('Codcliente.count') do
      post codclientes_url, params: { codcliente: { empresa_id: @codcliente.empresa_id, numr_codigo: @codcliente.numr_codigo } }
    end

    assert_redirected_to codcliente_url(Codcliente.last)
  end

  test "should show codcliente" do
    get codcliente_url(@codcliente)
    assert_response :success
  end

  test "should get edit" do
    get edit_codcliente_url(@codcliente)
    assert_response :success
  end

  test "should update codcliente" do
    patch codcliente_url(@codcliente), params: { codcliente: { empresa_id: @codcliente.empresa_id, numr_codigo: @codcliente.numr_codigo } }
    assert_redirected_to codcliente_url(@codcliente)
  end

  test "should destroy codcliente" do
    assert_difference('Codcliente.count', -1) do
      delete codcliente_url(@codcliente)
    end

    assert_redirected_to codclientes_url
  end
end
