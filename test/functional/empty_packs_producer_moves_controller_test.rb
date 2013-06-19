require 'test_helper'

class EmptyPacksProducerMovesControllerTest < ActionController::TestCase
  setup do
    @empty_packs_producer_move = empty_packs_producer_moves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:empty_packs_producer_moves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create empty_packs_producer_move" do
    assert_difference('EmptyPacksProducerMove.count') do
      post :create, empty_packs_producer_move: { company_id: @empty_packs_producer_move.company_id, pack_option: @empty_packs_producer_move.pack_option, pack_type_id: @empty_packs_producer_move.pack_type_id, producer_id: @empty_packs_producer_move.producer_id, quantity: @empty_packs_producer_move.quantity }
    end

    assert_redirected_to empty_packs_producer_move_path(assigns(:empty_packs_producer_move))
  end

  test "should show empty_packs_producer_move" do
    get :show, id: @empty_packs_producer_move
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @empty_packs_producer_move
    assert_response :success
  end

  test "should update empty_packs_producer_move" do
    put :update, id: @empty_packs_producer_move, empty_packs_producer_move: { company_id: @empty_packs_producer_move.company_id, pack_option: @empty_packs_producer_move.pack_option, pack_type_id: @empty_packs_producer_move.pack_type_id, producer_id: @empty_packs_producer_move.producer_id, quantity: @empty_packs_producer_move.quantity }
    assert_redirected_to empty_packs_producer_move_path(assigns(:empty_packs_producer_move))
  end

  test "should destroy empty_packs_producer_move" do
    assert_difference('EmptyPacksProducerMove.count', -1) do
      delete :destroy, id: @empty_packs_producer_move
    end

    assert_redirected_to empty_packs_producer_moves_path
  end
end
