require 'test_helper'

class PackTypesControllerTest < ActionController::TestCase
  setup do
    @pack_type = pack_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pack_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pack_type" do
    assert_difference('PackType.count') do
      post :create, pack_type: { company_id: @pack_type.company_id, name: @pack_type.name, tare: @pack_type.tare }
    end

    assert_redirected_to pack_type_path(assigns(:pack_type))
  end

  test "should show pack_type" do
    get :show, id: @pack_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pack_type
    assert_response :success
  end

  test "should update pack_type" do
    put :update, id: @pack_type, pack_type: { company_id: @pack_type.company_id, name: @pack_type.name, tare: @pack_type.tare }
    assert_redirected_to pack_type_path(assigns(:pack_type))
  end

  test "should destroy pack_type" do
    assert_difference('PackType.count', -1) do
      delete :destroy, id: @pack_type
    end

    assert_redirected_to pack_types_path
  end
end
