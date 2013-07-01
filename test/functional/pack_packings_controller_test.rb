require 'test_helper'

class PackPackingsControllerTest < ActionController::TestCase
  setup do
    @pack_packing = pack_packings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pack_packings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pack_packing" do
    assert_difference('PackPacking.count') do
      post :create, pack_packing: { name: @pack_packing.name }
    end

    assert_redirected_to pack_packing_path(assigns(:pack_packing))
  end

  test "should show pack_packing" do
    get :show, id: @pack_packing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pack_packing
    assert_response :success
  end

  test "should update pack_packing" do
    put :update, id: @pack_packing, pack_packing: { name: @pack_packing.name }
    assert_redirected_to pack_packing_path(assigns(:pack_packing))
  end

  test "should destroy pack_packing" do
    assert_difference('PackPacking.count', -1) do
      delete :destroy, id: @pack_packing
    end

    assert_redirected_to pack_packings_path
  end
end
