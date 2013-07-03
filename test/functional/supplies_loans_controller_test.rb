require 'test_helper'

class SuppliesLoansControllerTest < ActionController::TestCase
  setup do
    @supplies_loan = supplies_loans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supplies_loans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplies_loan" do
    assert_difference('SuppliesLoan.count') do
      post :create, supplies_loan: { company_id: @supplies_loan.company_id, quantity: @supplies_loan.quantity, supply_id: @supplies_loan.supply_id, worker_id: @supplies_loan.worker_id }
    end

    assert_redirected_to supplies_loan_path(assigns(:supplies_loan))
  end

  test "should show supplies_loan" do
    get :show, id: @supplies_loan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplies_loan
    assert_response :success
  end

  test "should update supplies_loan" do
    put :update, id: @supplies_loan, supplies_loan: { company_id: @supplies_loan.company_id, quantity: @supplies_loan.quantity, supply_id: @supplies_loan.supply_id, worker_id: @supplies_loan.worker_id }
    assert_redirected_to supplies_loan_path(assigns(:supplies_loan))
  end

  test "should destroy supplies_loan" do
    assert_difference('SuppliesLoan.count', -1) do
      delete :destroy, id: @supplies_loan
    end

    assert_redirected_to supplies_loans_path
  end
end
