require 'test_helper'

class PackGroupReceiptsControllerTest < ActionController::TestCase
  setup do
    @pack_group_receipt = pack_group_receipts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pack_group_receipts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pack_group_receipt" do
    assert_difference('PackGroupReceipt.count') do
      post :create, pack_group_receipt: { company_id: @pack_group_receipt.company_id, gross_weight: @pack_group_receipt.gross_weight, pack_type_id: @pack_group_receipt.pack_type_id, price_per_unit: @pack_group_receipt.price_per_unit, quality_id: @pack_group_receipt.quality_id, quantity: @pack_group_receipt.quantity, receipt_id: @pack_group_receipt.receipt_id, variety_id: @pack_group_receipt.variety_id }
    end

    assert_redirected_to pack_group_receipt_path(assigns(:pack_group_receipt))
  end

  test "should show pack_group_receipt" do
    get :show, id: @pack_group_receipt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pack_group_receipt
    assert_response :success
  end

  test "should update pack_group_receipt" do
    put :update, id: @pack_group_receipt, pack_group_receipt: { company_id: @pack_group_receipt.company_id, gross_weight: @pack_group_receipt.gross_weight, pack_type_id: @pack_group_receipt.pack_type_id, price_per_unit: @pack_group_receipt.price_per_unit, quality_id: @pack_group_receipt.quality_id, quantity: @pack_group_receipt.quantity, receipt_id: @pack_group_receipt.receipt_id, variety_id: @pack_group_receipt.variety_id }
    assert_redirected_to pack_group_receipt_path(assigns(:pack_group_receipt))
  end

  test "should destroy pack_group_receipt" do
    assert_difference('PackGroupReceipt.count', -1) do
      delete :destroy, id: @pack_group_receipt
    end

    assert_redirected_to pack_group_receipts_path
  end
end
