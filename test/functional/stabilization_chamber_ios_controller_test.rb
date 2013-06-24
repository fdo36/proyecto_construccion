require 'test_helper'

class StabilizationChamberIosControllerTest < ActionController::TestCase
  setup do
    @stabilization_chamber_io = stabilization_chamber_ios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stabilization_chamber_ios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stabilization_chamber_io" do
    assert_difference('StabilizationChamberIo.count') do
      post :create, stabilization_chamber_io: { temperature: @stabilization_chamber_io.temperature }
    end

    assert_redirected_to stabilization_chamber_io_path(assigns(:stabilization_chamber_io))
  end

  test "should show stabilization_chamber_io" do
    get :show, id: @stabilization_chamber_io
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stabilization_chamber_io
    assert_response :success
  end

  test "should update stabilization_chamber_io" do
    put :update, id: @stabilization_chamber_io, stabilization_chamber_io: { temperature: @stabilization_chamber_io.temperature }
    assert_redirected_to stabilization_chamber_io_path(assigns(:stabilization_chamber_io))
  end

  test "should destroy stabilization_chamber_io" do
    assert_difference('StabilizationChamberIo.count', -1) do
      delete :destroy, id: @stabilization_chamber_io
    end

    assert_redirected_to stabilization_chamber_ios_path
  end
end
