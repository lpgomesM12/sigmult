require 'test_helper'

class CodvendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @codvenda = codvendas(:one)
  end

  test "should get index" do
    get codvendas_url
    assert_response :success
  end

  test "should get new" do
    get new_codvenda_url
    assert_response :success
  end

  test "should create codvenda" do
    assert_difference('Codvenda.count') do
      post codvendas_url, params: { codvenda: { empresa_id: @codvenda.empresa_id, numr_contador: @codvenda.numr_contador } }
    end

    assert_redirected_to codvenda_url(Codvenda.last)
  end

  test "should show codvenda" do
    get codvenda_url(@codvenda)
    assert_response :success
  end

  test "should get edit" do
    get edit_codvenda_url(@codvenda)
    assert_response :success
  end

  test "should update codvenda" do
    patch codvenda_url(@codvenda), params: { codvenda: { empresa_id: @codvenda.empresa_id, numr_contador: @codvenda.numr_contador } }
    assert_redirected_to codvenda_url(@codvenda)
  end

  test "should destroy codvenda" do
    assert_difference('Codvenda.count', -1) do
      delete codvenda_url(@codvenda)
    end

    assert_redirected_to codvendas_url
  end
end
