require 'test_helper'

class DestinationPortsControllerTest < ActionController::TestCase
  setup do
    @destination_port = destination_ports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:destination_ports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create destination_port" do
    assert_difference('DestinationPort.count') do
      post :create, destination_port: { name: @destination_port.name }
    end

    assert_redirected_to destination_port_path(assigns(:destination_port))
  end

  test "should show destination_port" do
    get :show, id: @destination_port
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @destination_port
    assert_response :success
  end

  test "should update destination_port" do
    put :update, id: @destination_port, destination_port: { name: @destination_port.name }
    assert_redirected_to destination_port_path(assigns(:destination_port))
  end

  test "should destroy destination_port" do
    assert_difference('DestinationPort.count', -1) do
      delete :destroy, id: @destination_port
    end

    assert_redirected_to destination_ports_path
  end
end
