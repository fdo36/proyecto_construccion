require 'test_helper'

class PackGroupDispatchesControllerTest < ActionController::TestCase
  setup do
    @pack_group_dispatch = pack_group_dispatches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pack_group_dispatches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pack_group_dispatch" do
    assert_difference('PackGroupDispatch.count') do
      post :create, pack_group_dispatch: { company_id: @pack_group_dispatch.company_id, dispatch_id: @pack_group_dispatch.dispatch_id, gross_weight: @pack_group_dispatch.gross_weight, pack_type_id: @pack_group_dispatch.pack_type_id, quality_id: @pack_group_dispatch.quality_id, quantity: @pack_group_dispatch.quantity, variety_id: @pack_group_dispatch.variety_id }
    end

    assert_redirected_to pack_group_dispatch_path(assigns(:pack_group_dispatch))
  end

  test "should show pack_group_dispatch" do
    get :show, id: @pack_group_dispatch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pack_group_dispatch
    assert_response :success
  end

  test "should update pack_group_dispatch" do
    put :update, id: @pack_group_dispatch, pack_group_dispatch: { company_id: @pack_group_dispatch.company_id, dispatch_id: @pack_group_dispatch.dispatch_id, gross_weight: @pack_group_dispatch.gross_weight, pack_type_id: @pack_group_dispatch.pack_type_id, quality_id: @pack_group_dispatch.quality_id, quantity: @pack_group_dispatch.quantity, variety_id: @pack_group_dispatch.variety_id }
    assert_redirected_to pack_group_dispatch_path(assigns(:pack_group_dispatch))
  end

  test "should destroy pack_group_dispatch" do
    assert_difference('PackGroupDispatch.count', -1) do
      delete :destroy, id: @pack_group_dispatch
    end

    assert_redirected_to pack_group_dispatches_path
  end
end
