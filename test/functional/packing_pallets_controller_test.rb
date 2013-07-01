require 'test_helper'

class PackingPalletsControllerTest < ActionController::TestCase
  setup do
    @packing_pallet = packing_pallets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packing_pallets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create packing_pallet" do
    assert_difference('PackingPallet.count') do
      post :create, packing_pallet: { gross_weight: @packing_pallet.gross_weight, pack_type: @packing_pallet.pack_type, quantity: @packing_pallet.quantity, tare: @packing_pallet.tare, temperature: @packing_pallet.temperature, unit_price: @packing_pallet.unit_price }
    end

    assert_redirected_to packing_pallet_path(assigns(:packing_pallet))
  end

  test "should show packing_pallet" do
    get :show, id: @packing_pallet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @packing_pallet
    assert_response :success
  end

  test "should update packing_pallet" do
    put :update, id: @packing_pallet, packing_pallet: { gross_weight: @packing_pallet.gross_weight, pack_type: @packing_pallet.pack_type, quantity: @packing_pallet.quantity, tare: @packing_pallet.tare, temperature: @packing_pallet.temperature, unit_price: @packing_pallet.unit_price }
    assert_redirected_to packing_pallet_path(assigns(:packing_pallet))
  end

  test "should destroy packing_pallet" do
    assert_difference('PackingPallet.count', -1) do
      delete :destroy, id: @packing_pallet
    end

    assert_redirected_to packing_pallets_path
  end
end
