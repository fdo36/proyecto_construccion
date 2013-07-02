require 'test_helper'

class FrozenTunnelIosControllerTest < ActionController::TestCase
  setup do
    @frozen_tunnel_io = frozen_tunnel_ios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frozen_tunnel_ios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frozen_tunnel_io" do
    assert_difference('FrozenTunnelIo.count') do
      post :create, frozen_tunnel_io: { order_number: @frozen_tunnel_io.order_number, packing_pallet_temperature: @frozen_tunnel_io.packing_pallet_temperature, tunnel_id: @frozen_tunnel_io.tunnel_id, tunnel_temperature: @frozen_tunnel_io.tunnel_temperature }
    end

    assert_redirected_to frozen_tunnel_io_path(assigns(:frozen_tunnel_io))
  end

  test "should show frozen_tunnel_io" do
    get :show, id: @frozen_tunnel_io
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @frozen_tunnel_io
    assert_response :success
  end

  test "should update frozen_tunnel_io" do
    put :update, id: @frozen_tunnel_io, frozen_tunnel_io: { order_number: @frozen_tunnel_io.order_number, packing_pallet_temperature: @frozen_tunnel_io.packing_pallet_temperature, tunnel_id: @frozen_tunnel_io.tunnel_id, tunnel_temperature: @frozen_tunnel_io.tunnel_temperature }
    assert_redirected_to frozen_tunnel_io_path(assigns(:frozen_tunnel_io))
  end

  test "should destroy frozen_tunnel_io" do
    assert_difference('FrozenTunnelIo.count', -1) do
      delete :destroy, id: @frozen_tunnel_io
    end

    assert_redirected_to frozen_tunnel_ios_path
  end
end
