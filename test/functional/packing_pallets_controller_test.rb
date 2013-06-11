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
      post :create, packing_pallet: {  }
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
    put :update, id: @packing_pallet, packing_pallet: {  }
    assert_redirected_to packing_pallet_path(assigns(:packing_pallet))
  end

  test "should destroy packing_pallet" do
    assert_difference('PackingPallet.count', -1) do
      delete :destroy, id: @packing_pallet
    end

    assert_redirected_to packing_pallets_path
  end
end
