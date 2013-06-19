require 'test_helper'

class TransitChamberIosControllerTest < ActionController::TestCase
  setup do
    @transit_chamber_io = transit_chamber_ios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transit_chamber_ios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transit_chamber_io" do
    assert_difference('TransitChamberIo.count') do
      post :create, transit_chamber_io: { order_number: @transit_chamber_io.order_number, temperature: @transit_chamber_io.temperature }
    end

    assert_redirected_to transit_chamber_io_path(assigns(:transit_chamber_io))
  end

  test "should show transit_chamber_io" do
    get :show, id: @transit_chamber_io
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transit_chamber_io
    assert_response :success
  end

  test "should update transit_chamber_io" do
    put :update, id: @transit_chamber_io, transit_chamber_io: { order_number: @transit_chamber_io.order_number, temperature: @transit_chamber_io.temperature }
    assert_redirected_to transit_chamber_io_path(assigns(:transit_chamber_io))
  end

  test "should destroy transit_chamber_io" do
    assert_difference('TransitChamberIo.count', -1) do
      delete :destroy, id: @transit_chamber_io
    end

    assert_redirected_to transit_chamber_ios_path
  end
end
