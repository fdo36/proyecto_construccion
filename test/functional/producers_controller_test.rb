require 'test_helper'

class ProducersControllerTest < ActionController::TestCase
  setup do
    @producer = producers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:producers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create producer" do
    assert_difference('Producer.count') do
      post :create, producer: { active: @producer.active, address: @producer.address, commune_id: @producer.commune_id, company_name: @producer.company_name, contact: @producer.contact, email: @producer.email, line_of_business: @producer.line_of_business, phone: @producer.phone, rut: @producer.rut, sag_code: @producer.sag_code }
    end

    assert_redirected_to producer_path(assigns(:producer))
  end

  test "should show producer" do
    get :show, id: @producer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @producer
    assert_response :success
  end

  test "should update producer" do
    put :update, id: @producer, producer: { active: @producer.active, address: @producer.address, commune_id: @producer.commune_id, company_name: @producer.company_name, contact: @producer.contact, email: @producer.email, line_of_business: @producer.line_of_business, phone: @producer.phone, rut: @producer.rut, sag_code: @producer.sag_code }
    assert_redirected_to producer_path(assigns(:producer))
  end

  test "should destroy producer" do
    assert_difference('Producer.count', -1) do
      delete :destroy, id: @producer
    end

    assert_redirected_to producers_path
  end
end
