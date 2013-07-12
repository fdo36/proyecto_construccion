require 'test_helper'

class DestinationPackingsControllerTest < ActionController::TestCase
  setup do
    @destination_packing = destination_packings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:destination_packings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create destination_packing" do
    assert_difference('DestinationPacking.count') do
      post :create, destination_packing: { company_id: @destination_packing.company_id, email: @destination_packing.email, international: @destination_packing.international, name: @destination_packing.name, phone: @destination_packing.phone }
    end

    assert_redirected_to destination_packing_path(assigns(:destination_packing))
  end

  test "should show destination_packing" do
    get :show, id: @destination_packing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @destination_packing
    assert_response :success
  end

  test "should update destination_packing" do
    put :update, id: @destination_packing, destination_packing: { company_id: @destination_packing.company_id, email: @destination_packing.email, international: @destination_packing.international, name: @destination_packing.name, phone: @destination_packing.phone }
    assert_redirected_to destination_packing_path(assigns(:destination_packing))
  end

  test "should destroy destination_packing" do
    assert_difference('DestinationPacking.count', -1) do
      delete :destroy, id: @destination_packing
    end

    assert_redirected_to destination_packings_path
  end
end
