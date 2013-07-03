require 'test_helper'

class SuppliesProvidersLoansControllerTest < ActionController::TestCase
  setup do
    @supplies_providers_loan = supplies_providers_loans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supplies_providers_loans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplies_providers_loan" do
    assert_difference('SuppliesProvidersLoan.count') do
      post :create, supplies_providers_loan: { company_id: @supplies_providers_loan.company_id, provider_id: @supplies_providers_loan.provider_id, quantity: @supplies_providers_loan.quantity, supply_id: @supplies_providers_loan.supply_id }
    end

    assert_redirected_to supplies_providers_loan_path(assigns(:supplies_providers_loan))
  end

  test "should show supplies_providers_loan" do
    get :show, id: @supplies_providers_loan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplies_providers_loan
    assert_response :success
  end

  test "should update supplies_providers_loan" do
    put :update, id: @supplies_providers_loan, supplies_providers_loan: { company_id: @supplies_providers_loan.company_id, provider_id: @supplies_providers_loan.provider_id, quantity: @supplies_providers_loan.quantity, supply_id: @supplies_providers_loan.supply_id }
    assert_redirected_to supplies_providers_loan_path(assigns(:supplies_providers_loan))
  end

  test "should destroy supplies_providers_loan" do
    assert_difference('SuppliesProvidersLoan.count', -1) do
      delete :destroy, id: @supplies_providers_loan
    end

    assert_redirected_to supplies_providers_loans_path
  end
end
