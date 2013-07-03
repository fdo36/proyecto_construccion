require 'test_helper'

class StoreFinishProductsControllerTest < ActionController::TestCase
  setup do
    @store_finish_product = store_finish_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_finish_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store_finish_product" do
    assert_difference('StoreFinishProduct.count') do
      post :create, store_finish_product: { store_time: @store_finish_product.store_time, time_out: @store_finish_product.time_out }
    end

    assert_redirected_to store_finish_product_path(assigns(:store_finish_product))
  end

  test "should show store_finish_product" do
    get :show, id: @store_finish_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store_finish_product
    assert_response :success
  end

  test "should update store_finish_product" do
    put :update, id: @store_finish_product, store_finish_product: { store_time: @store_finish_product.store_time, time_out: @store_finish_product.time_out }
    assert_redirected_to store_finish_product_path(assigns(:store_finish_product))
  end

  test "should destroy store_finish_product" do
    assert_difference('StoreFinishProduct.count', -1) do
      delete :destroy, id: @store_finish_product
    end

    assert_redirected_to store_finish_products_path
  end
end
