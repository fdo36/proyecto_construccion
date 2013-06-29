require 'test_helper'

class FinalPackingPalletsControllerTest < ActionController::TestCase
  setup do
    @final_packing_pallet = final_packing_pallets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:final_packing_pallets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create final_packing_pallet" do
    assert_difference('FinalPackingPallet.count') do
      post :create, final_packing_pallet: { format_id: @final_packing_pallet.format_id, kind_id: @final_packing_pallet.kind_id, net_weight: @final_packing_pallet.net_weight, pack_packing_id: @final_packing_pallet.pack_packing_id, quality_id: @final_packing_pallet.quality_id, quantity: @final_packing_pallet.quantity, variety_id: @final_packing_pallet.variety_id }
    end

    assert_redirected_to final_packing_pallet_path(assigns(:final_packing_pallet))
  end

  test "should show final_packing_pallet" do
    get :show, id: @final_packing_pallet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @final_packing_pallet
    assert_response :success
  end

  test "should update final_packing_pallet" do
    put :update, id: @final_packing_pallet, final_packing_pallet: { format_id: @final_packing_pallet.format_id, kind_id: @final_packing_pallet.kind_id, net_weight: @final_packing_pallet.net_weight, pack_packing_id: @final_packing_pallet.pack_packing_id, quality_id: @final_packing_pallet.quality_id, quantity: @final_packing_pallet.quantity, variety_id: @final_packing_pallet.variety_id }
    assert_redirected_to final_packing_pallet_path(assigns(:final_packing_pallet))
  end

  test "should destroy final_packing_pallet" do
    assert_difference('FinalPackingPallet.count', -1) do
      delete :destroy, id: @final_packing_pallet
    end

    assert_redirected_to final_packing_pallets_path
  end
end
