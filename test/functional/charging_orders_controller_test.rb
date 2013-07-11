require 'test_helper'

class ChargingOrdersControllerTest < ActionController::TestCase
  setup do
    @charging_order = charging_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:charging_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create charging_order" do
    assert_difference('ChargingOrder.count') do
      post :create, charging_order: { custom_agent_id: @charging_order.custom_agent_id, destination_port_id: @charging_order.destination_port_id, origin_port_id: @charging_order.origin_port_id }
    end

    assert_redirected_to charging_order_path(assigns(:charging_order))
  end

  test "should show charging_order" do
    get :show, id: @charging_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @charging_order
    assert_response :success
  end

  test "should update charging_order" do
    put :update, id: @charging_order, charging_order: { custom_agent_id: @charging_order.custom_agent_id, destination_port_id: @charging_order.destination_port_id, origin_port_id: @charging_order.origin_port_id }
    assert_redirected_to charging_order_path(assigns(:charging_order))
  end

  test "should destroy charging_order" do
    assert_difference('ChargingOrder.count', -1) do
      delete :destroy, id: @charging_order
    end

    assert_redirected_to charging_orders_path
  end
end
