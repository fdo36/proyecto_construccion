require 'test_helper'

class ReceiptContainersControllerTest < ActionController::TestCase
  setup do
    @receipt_container = receipt_containers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receipt_containers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receipt_container" do
    assert_difference('ReceiptContainer.count') do
      post :create, receipt_container: { container_id: @receipt_container.container_id, gross_weight: @receipt_container.gross_weight, price_kg: @receipt_container.price_kg, quality_id: @receipt_container.quality_id, quantity: @receipt_container.quantity, receipt_id: @receipt_container.receipt_id, variety_id: @receipt_container.variety_id }
    end

    assert_redirected_to receipt_container_path(assigns(:receipt_container))
  end

  test "should show receipt_container" do
    get :show, id: @receipt_container
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receipt_container
    assert_response :success
  end

  test "should update receipt_container" do
    put :update, id: @receipt_container, receipt_container: { container_id: @receipt_container.container_id, gross_weight: @receipt_container.gross_weight, price_kg: @receipt_container.price_kg, quality_id: @receipt_container.quality_id, quantity: @receipt_container.quantity, receipt_id: @receipt_container.receipt_id, variety_id: @receipt_container.variety_id }
    assert_redirected_to receipt_container_path(assigns(:receipt_container))
  end

  test "should destroy receipt_container" do
    assert_difference('ReceiptContainer.count', -1) do
      delete :destroy, id: @receipt_container
    end

    assert_redirected_to receipt_containers_path
  end
end
