require 'test_helper'

class SubprocessIosControllerTest < ActionController::TestCase
  setup do
    @subprocess_io = subprocess_ios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subprocess_ios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subprocess_io" do
    assert_difference('SubprocessIo.count') do
      post :create, subprocess_io: { direction: @subprocess_io.direction, io_datetime: @subprocess_io.io_datetime, packing_pallet_id: @subprocess_io.packing_pallet_id, subprocess_id: @subprocess_io.subprocess_id, worker_id: @subprocess_io.worker_id }
    end

    assert_redirected_to subprocess_io_path(assigns(:subprocess_io))
  end

  test "should show subprocess_io" do
    get :show, id: @subprocess_io
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subprocess_io
    assert_response :success
  end

  test "should update subprocess_io" do
    put :update, id: @subprocess_io, subprocess_io: { direction: @subprocess_io.direction, io_datetime: @subprocess_io.io_datetime, packing_pallet_id: @subprocess_io.packing_pallet_id, subprocess_id: @subprocess_io.subprocess_id, worker_id: @subprocess_io.worker_id }
    assert_redirected_to subprocess_io_path(assigns(:subprocess_io))
  end

  test "should destroy subprocess_io" do
    assert_difference('SubprocessIo.count', -1) do
      delete :destroy, id: @subprocess_io
    end

    assert_redirected_to subprocess_ios_path
  end
end
