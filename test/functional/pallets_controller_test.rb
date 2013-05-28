require 'test_helper'

class PalletsControllerTest < ActionController::TestCase
  setup do
    @pallet = pallets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pallets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pallet" do
    assert_difference('Pallet.count') do
      post :create, pallet: { code: @pallet.code, company_id: @pallet.company_id, dispatch_id: @pallet.dispatch_id, gross_weight: @pallet.gross_weight, pack_type_id: @pallet.pack_type_id, price_per_unit: @pallet.price_per_unit, quality_id: @pallet.quality_id, quantity: @pallet.quantity, receipt_id: @pallet.receipt_id, tare: @pallet.tare, variety_id: @pallet.variety_id }
    end

    assert_redirected_to pallet_path(assigns(:pallet))
  end

  test "should show pallet" do
    get :show, id: @pallet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pallet
    assert_response :success
  end

  test "should update pallet" do
    put :update, id: @pallet, pallet: { code: @pallet.code, company_id: @pallet.company_id, dispatch_id: @pallet.dispatch_id, gross_weight: @pallet.gross_weight, pack_type_id: @pallet.pack_type_id, price_per_unit: @pallet.price_per_unit, quality_id: @pallet.quality_id, quantity: @pallet.quantity, receipt_id: @pallet.receipt_id, tare: @pallet.tare, variety_id: @pallet.variety_id }
    assert_redirected_to pallet_path(assigns(:pallet))
  end

  test "should destroy pallet" do
    assert_difference('Pallet.count', -1) do
      delete :destroy, id: @pallet
    end

    assert_redirected_to pallets_path
  end
end
