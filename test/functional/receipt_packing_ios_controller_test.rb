require 'test_helper'

class ReceiptPackingIosControllerTest < ActionController::TestCase
  setup do
    @receipt_packing_io = receipt_packing_ios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receipt_packing_ios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receipt_packing_io" do
    assert_difference('ReceiptPackingIo.count') do
      post :create, receipt_packing_io: { code: @receipt_packing_io.code, comments: @receipt_packing_io.comments, dispatch_guide_number: @receipt_packing_io.dispatch_guide_number, pack_type: @receipt_packing_io.pack_type, producer_id: @receipt_packing_io.producer_id, trazability_code: @receipt_packing_io.trazability_code }
    end

    assert_redirected_to receipt_packing_io_path(assigns(:receipt_packing_io))
  end

  test "should show receipt_packing_io" do
    get :show, id: @receipt_packing_io
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receipt_packing_io
    assert_response :success
  end

  test "should update receipt_packing_io" do
    put :update, id: @receipt_packing_io, receipt_packing_io: { code: @receipt_packing_io.code, comments: @receipt_packing_io.comments, dispatch_guide_number: @receipt_packing_io.dispatch_guide_number, pack_type: @receipt_packing_io.pack_type, producer_id: @receipt_packing_io.producer_id, trazability_code: @receipt_packing_io.trazability_code }
    assert_redirected_to receipt_packing_io_path(assigns(:receipt_packing_io))
  end

  test "should destroy receipt_packing_io" do
    assert_difference('ReceiptPackingIo.count', -1) do
      delete :destroy, id: @receipt_packing_io
    end

    assert_redirected_to receipt_packing_ios_path
  end
end
