require 'test_helper'

class CustomsControllerTest < ActionController::TestCase
  setup do
    @custom = customs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom" do
    assert_difference('Custom.count') do
      post :create, custom: { address: @custom.address, code: @custom.code, email: @custom.email, fax: @custom.fax, line_of_business: @custom.line_of_business, location: @custom.location, phone: @custom.phone, rut: @custom.rut }
    end

    assert_redirected_to custom_path(assigns(:custom))
  end

  test "should show custom" do
    get :show, id: @custom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom
    assert_response :success
  end

  test "should update custom" do
    put :update, id: @custom, custom: { address: @custom.address, code: @custom.code, email: @custom.email, fax: @custom.fax, line_of_business: @custom.line_of_business, location: @custom.location, phone: @custom.phone, rut: @custom.rut }
    assert_redirected_to custom_path(assigns(:custom))
  end

  test "should destroy custom" do
    assert_difference('Custom.count', -1) do
      delete :destroy, id: @custom
    end

    assert_redirected_to customs_path
  end
end
