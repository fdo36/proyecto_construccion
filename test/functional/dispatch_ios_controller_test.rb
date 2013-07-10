require 'test_helper'

class DispatchIosControllerTest < ActionController::TestCase
  setup do
    @dispatch_io = dispatch_ios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dispatch_ios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dispatch_io" do
    assert_difference('DispatchIo.count') do
      post :create, dispatch_io: { charging_order_id: @dispatch_io.charging_order_id, charging_temperature: @dispatch_io.charging_temperature, container_code: @dispatch_io.container_code, dispatch_temperature: @dispatch_io.dispatch_temperature, name_driver: @dispatch_io.name_driver, number: @dispatch_io.number, patent: @dispatch_io.patent, rut_driver: @dispatch_io.rut_driver }
    end

    assert_redirected_to dispatch_io_path(assigns(:dispatch_io))
  end

  test "should show dispatch_io" do
    get :show, id: @dispatch_io
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dispatch_io
    assert_response :success
  end

  test "should update dispatch_io" do
    put :update, id: @dispatch_io, dispatch_io: { charging_order_id: @dispatch_io.charging_order_id, charging_temperature: @dispatch_io.charging_temperature, container_code: @dispatch_io.container_code, dispatch_temperature: @dispatch_io.dispatch_temperature, name_driver: @dispatch_io.name_driver, number: @dispatch_io.number, patent: @dispatch_io.patent, rut_driver: @dispatch_io.rut_driver }
    assert_redirected_to dispatch_io_path(assigns(:dispatch_io))
  end

  test "should destroy dispatch_io" do
    assert_difference('DispatchIo.count', -1) do
      delete :destroy, id: @dispatch_io
    end

    assert_redirected_to dispatch_ios_path
  end
end
