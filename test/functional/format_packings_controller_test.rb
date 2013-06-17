require 'test_helper'

class FormatPackingsControllerTest < ActionController::TestCase
  setup do
    @format_packing = format_packings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:format_packings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create format_packing" do
    assert_difference('FormatPacking.count') do
      post :create, format_packing: { name: @format_packing.name, quantity: @format_packing.quantity, weight: @format_packing.weight }
    end

    assert_redirected_to format_packing_path(assigns(:format_packing))
  end

  test "should show format_packing" do
    get :show, id: @format_packing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @format_packing
    assert_response :success
  end

  test "should update format_packing" do
    put :update, id: @format_packing, format_packing: { name: @format_packing.name, quantity: @format_packing.quantity, weight: @format_packing.weight }
    assert_redirected_to format_packing_path(assigns(:format_packing))
  end

  test "should destroy format_packing" do
    assert_difference('FormatPacking.count', -1) do
      delete :destroy, id: @format_packing
    end

    assert_redirected_to format_packings_path
  end
end
