require 'test_helper'

class AccountEmployeeTest < ActiveSupport::TestCase
  test "Should not save account employee without data" do
    account_employee = AccountEmployee.new()
    assert_not account_employee.valid?, "Cannot save account employee without data. Errors: #{account_employee.errors.to_a.to_sentence}"
  end

  test "Should not save account employee without date" do
    account_employee = AccountEmployee.new(pay:0, contract_id:1)
    assert_not account_employee.valid?, "Cannot save account employee without date. Errors: #{account_employee.errors.to_a.to_sentence}"
  end

  test "Should not save account employee without contract" do
    account_employee = AccountEmployee.new(pay:0)
    assert_not account_employee.valid?, "Cannot save account employee without contract. Errors: #{account_employee.errors.to_a.to_sentence}"
  end

  test "Should discount balance of employee" do
    assert_equal(true, AccountEmployee.first.discount_balance_employee)
    assert_equal(1000, AccountEmployee.first.account_employee_details.first.employee.balance)
    assert_equal("Pagado", AccountEmployee.first.account_employee_details.first.state)
  end

  test "Should calculate total certified" do
    assert_equal(200, AccountEmployee.last.pay_aux)
  end
end
