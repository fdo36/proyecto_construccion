require 'test_helper'

class TunnelsControllerTest < ActionController::TestCase
  setup do
    @tunnel = tunnels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tunnels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tunnel" do
    assert_difference('Tunnel.count') do
      post :create, tunnel: { name: @tunnel.name }
    end

    assert_redirected_to tunnel_path(assigns(:tunnel))
  end

  test "should show tunnel" do
    get :show, id: @tunnel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tunnel
    assert_response :success
  end

  test "should update tunnel" do
    put :update, id: @tunnel, tunnel: { name: @tunnel.name }
    assert_redirected_to tunnel_path(assigns(:tunnel))
  end

  test "should destroy tunnel" do
    assert_difference('Tunnel.count', -1) do
      delete :destroy, id: @tunnel
    end

    assert_redirected_to tunnels_path
  end
end
