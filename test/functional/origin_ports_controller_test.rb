require 'test_helper'

class OriginPortsControllerTest < ActionController::TestCase
  setup do
    @origin_port = origin_ports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:origin_ports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create origin_port" do
    assert_difference('OriginPort.count') do
      post :create, origin_port: { name: @origin_port.name }
    end

    assert_redirected_to origin_port_path(assigns(:origin_port))
  end

  test "should show origin_port" do
    get :show, id: @origin_port
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @origin_port
    assert_response :success
  end

  test "should update origin_port" do
    put :update, id: @origin_port, origin_port: { name: @origin_port.name }
    assert_redirected_to origin_port_path(assigns(:origin_port))
  end

  test "should destroy origin_port" do
    assert_difference('OriginPort.count', -1) do
      delete :destroy, id: @origin_port
    end

    assert_redirected_to origin_ports_path
  end
end
