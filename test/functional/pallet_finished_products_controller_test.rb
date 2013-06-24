require 'test_helper'

class PalletFinishedProductsControllerTest < ActionController::TestCase
  setup do
    @pallet_finished_product = pallet_finished_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pallet_finished_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pallet_finished_product" do
    assert_difference('PalletFinishedProduct.count') do
      post :create, pallet_finished_product: { format_packing_id: @pallet_finished_product.format_packing_id, kind_id: @pallet_finished_product.kind_id, net_weight: @pallet_finished_product.net_weight, pack_packing_id: @pallet_finished_product.pack_packing_id, quality: @pallet_finished_product.quality, quantity: @pallet_finished_product.quantity, variety: @pallet_finished_product.variety }
    end

    assert_redirected_to pallet_finished_product_path(assigns(:pallet_finished_product))
  end

  test "should show pallet_finished_product" do
    get :show, id: @pallet_finished_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pallet_finished_product
    assert_response :success
  end

  test "should update pallet_finished_product" do
    put :update, id: @pallet_finished_product, pallet_finished_product: { format_packing_id: @pallet_finished_product.format_packing_id, kind_id: @pallet_finished_product.kind_id, net_weight: @pallet_finished_product.net_weight, pack_packing_id: @pallet_finished_product.pack_packing_id, quality: @pallet_finished_product.quality, quantity: @pallet_finished_product.quantity, variety: @pallet_finished_product.variety }
    assert_redirected_to pallet_finished_product_path(assigns(:pallet_finished_product))
  end

  test "should destroy pallet_finished_product" do
    assert_difference('PalletFinishedProduct.count', -1) do
      delete :destroy, id: @pallet_finished_product
    end

    assert_redirected_to pallet_finished_products_path
  end
end
