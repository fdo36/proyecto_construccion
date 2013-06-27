require 'test_helper'

class FrozenTunnelsControllerTest < ActionController::TestCase
  setup do
    @frozen_tunnel = frozen_tunnels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frozen_tunnels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frozen_tunnel" do
    assert_difference('FrozenTunnel.count') do
      post :create, frozen_tunnel: { order_number: @frozen_tunnel.order_number, packing_pallet_temperature: @frozen_tunnel.packing_pallet_temperature, tunnel_id: @frozen_tunnel.tunnel_id, tunnel_temperature: @frozen_tunnel.tunnel_temperature }
    end

    assert_redirected_to frozen_tunnel_path(assigns(:frozen_tunnel))
  end

  test "should show frozen_tunnel" do
    get :show, id: @frozen_tunnel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @frozen_tunnel
    assert_response :success
  end

  test "should update frozen_tunnel" do
    put :update, id: @frozen_tunnel, frozen_tunnel: { order_number: @frozen_tunnel.order_number, packing_pallet_temperature: @frozen_tunnel.packing_pallet_temperature, tunnel_id: @frozen_tunnel.tunnel_id, tunnel_temperature: @frozen_tunnel.tunnel_temperature }
    assert_redirected_to frozen_tunnel_path(assigns(:frozen_tunnel))
  end

  test "should destroy frozen_tunnel" do
    assert_difference('FrozenTunnel.count', -1) do
      delete :destroy, id: @frozen_tunnel
    end

    assert_redirected_to frozen_tunnels_path
  end
end
