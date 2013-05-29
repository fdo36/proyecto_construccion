require 'test_helper'

class DispatchContainersControllerTest < ActionController::TestCase
  setup do
    @dispatch_container = dispatch_containers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dispatch_containers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dispatch_container" do
    assert_difference('DispatchContainer.count') do
      post :create, dispatch_container: { container_id: @dispatch_container.container_id, dispatch_id: @dispatch_container.dispatch_id, gross_weight: @dispatch_container.gross_weight, quality_id: @dispatch_container.quality_id, quantity: @dispatch_container.quantity, variety_id: @dispatch_container.variety_id }
    end

    assert_redirected_to dispatch_container_path(assigns(:dispatch_container))
  end

  test "should show dispatch_container" do
    get :show, id: @dispatch_container
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dispatch_container
    assert_response :success
  end

  test "should update dispatch_container" do
    put :update, id: @dispatch_container, dispatch_container: { container_id: @dispatch_container.container_id, dispatch_id: @dispatch_container.dispatch_id, gross_weight: @dispatch_container.gross_weight, quality_id: @dispatch_container.quality_id, quantity: @dispatch_container.quantity, variety_id: @dispatch_container.variety_id }
    assert_redirected_to dispatch_container_path(assigns(:dispatch_container))
  end

  test "should destroy dispatch_container" do
    assert_difference('DispatchContainer.count', -1) do
      delete :destroy, id: @dispatch_container
    end

    assert_redirected_to dispatch_containers_path
  end
end
