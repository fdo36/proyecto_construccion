require 'test_helper'

class ProductionProcessIosControllerTest < ActionController::TestCase
  setup do
    @production_process_io = production_process_ios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_process_ios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_process_io" do
    assert_difference('ProductionProcessIo.count') do
      post :create, production_process_io: { order_number: @production_process_io.order_number, production_lines_number: @production_process_io.production_lines_number }
    end

    assert_redirected_to production_process_io_path(assigns(:production_process_io))
  end

  test "should show production_process_io" do
    get :show, id: @production_process_io
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_process_io
    assert_response :success
  end

  test "should update production_process_io" do
    put :update, id: @production_process_io, production_process_io: { order_number: @production_process_io.order_number, production_lines_number: @production_process_io.production_lines_number }
    assert_redirected_to production_process_io_path(assigns(:production_process_io))
  end

  test "should destroy production_process_io" do
    assert_difference('ProductionProcessIo.count', -1) do
      delete :destroy, id: @production_process_io
    end

    assert_redirected_to production_process_ios_path
  end
end
