require 'test_helper'

class AccountEmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account_employee = account_employees(:one)
  end

  test "should get index" do
    get account_employees_url
    assert_response :success
  end

  test "should get new" do
    get new_account_employee_url
    assert_response :success
  end

  test "should create account_employee" do
    assert_difference('AccountEmployee.count') do
      post account_employees_url, params: { account_employee: { contract_id: @account_employee.contract_id, date: @account_employee.date, employee_id: @account_employee.employee_id, number_bill: @account_employee.number_bill, pay: @account_employee.pay } }
    end

    assert_redirected_to account_employee_url(AccountEmployee.last)
  end

  test "should show account_employee" do
    get account_employee_url(@account_employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_employee_url(@account_employee)
    assert_response :success
  end

  test "should update account_employee" do
    patch account_employee_url(@account_employee), params: { account_employee: { contract_id: @account_employee.contract_id, date: @account_employee.date, employee_id: @account_employee.employee_id, number_bill: @account_employee.number_bill, pay: @account_employee.pay } }
    assert_redirected_to account_employee_url(@account_employee)
  end

  test "should destroy account_employee" do
    assert_difference('AccountEmployee.count', -1) do
      delete account_employee_url(@account_employee)
    end

    assert_redirected_to account_employees_url
  end
end
