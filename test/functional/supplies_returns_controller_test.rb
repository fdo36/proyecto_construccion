require 'test_helper'

class SuppliesReturnsControllerTest < ActionController::TestCase
  setup do
    @supplies_return = supplies_returns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supplies_returns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplies_return" do
    assert_difference('SuppliesReturn.count') do
      post :create, supplies_return: { company_id: @supplies_return.company_id, quantity: @supplies_return.quantity, supply_id: @supplies_return.supply_id, worker_id: @supplies_return.worker_id }
    end

    assert_redirected_to supplies_return_path(assigns(:supplies_return))
  end

  test "should show supplies_return" do
    get :show, id: @supplies_return
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplies_return
    assert_response :success
  end

  test "should update supplies_return" do
    put :update, id: @supplies_return, supplies_return: { company_id: @supplies_return.company_id, quantity: @supplies_return.quantity, supply_id: @supplies_return.supply_id, worker_id: @supplies_return.worker_id }
    assert_redirected_to supplies_return_path(assigns(:supplies_return))
  end

  test "should destroy supplies_return" do
    assert_difference('SuppliesReturn.count', -1) do
      delete :destroy, id: @supplies_return
    end

    assert_redirected_to supplies_returns_path
  end
end
