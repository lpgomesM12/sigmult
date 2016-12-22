require 'test_helper'

class ItenvendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itenvenda = itenvendas(:one)
  end

  test "should get index" do
    get itenvendas_url
    assert_response :success
  end

  test "should get new" do
    get new_itenvenda_url
    assert_response :success
  end

  test "should create itenvenda" do
    assert_difference('Itenvenda.count') do
      post itenvendas_url, params: { itenvenda: { produto_id: @itenvenda.produto_id, qtd_item: @itenvenda.qtd_item, valor_unitario: @itenvenda.valor_unitario, valr_total: @itenvenda.valr_total, venda_id: @itenvenda.venda_id } }
    end

    assert_redirected_to itenvenda_url(Itenvenda.last)
  end

  test "should show itenvenda" do
    get itenvenda_url(@itenvenda)
    assert_response :success
  end

  test "should get edit" do
    get edit_itenvenda_url(@itenvenda)
    assert_response :success
  end

  test "should update itenvenda" do
    patch itenvenda_url(@itenvenda), params: { itenvenda: { produto_id: @itenvenda.produto_id, qtd_item: @itenvenda.qtd_item, valor_unitario: @itenvenda.valor_unitario, valr_total: @itenvenda.valr_total, venda_id: @itenvenda.venda_id } }
    assert_redirected_to itenvenda_url(@itenvenda)
  end

  test "should destroy itenvenda" do
    assert_difference('Itenvenda.count', -1) do
      delete itenvenda_url(@itenvenda)
    end

    assert_redirected_to itenvendas_url
  end
end
