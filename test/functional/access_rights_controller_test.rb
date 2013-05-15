require 'test_helper'

class AccessRightsControllerTest < ActionController::TestCase
  setup do
    @access_right = access_rights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:access_rights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create access_right" do
    assert_difference('AccessRight.count') do
      post :create, access_right: { action: @access_right.action, model_name: @access_right.model_name }
    end

    assert_redirected_to access_right_path(assigns(:access_right))
  end

  test "should show access_right" do
    get :show, id: @access_right
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @access_right
    assert_response :success
  end

  test "should update access_right" do
    put :update, id: @access_right, access_right: { action: @access_right.action, model_name: @access_right.model_name }
    assert_redirected_to access_right_path(assigns(:access_right))
  end

  test "should destroy access_right" do
    assert_difference('AccessRight.count', -1) do
      delete :destroy, id: @access_right
    end

    assert_redirected_to access_rights_path
  end
end
