require 'test_helper'

class AccountEmployeeDetailTest < ActiveSupport::TestCase
  test "Should not save account detail without data" do
    account_detail = AccountEmployeeDetail.new()
    assert_not account_detail.valid?, "Cannot save account detail without data. Errors: #{account_detail.errors.to_a.to_sentence}"
  end

  test "Should not save account detail without account employee" do
    account_detail = AccountEmployeeDetail.new(total:0, pay:0, number_bill:0, certification_id:1, date:Date.today, state:"Pendiente" )
    assert_not account_detail.valid?, "Cannot save account detail without account employee. Errors: #{account_detail.errors.to_a.to_sentence}"
  end

  test "Should not save account detail without employee" do
    account_detail = AccountEmployeeDetail.new(account_employee_id:1, total:0, pay:0, number_bill:0, certification_id:1, date:Date.today, state:"Pendiente" )
    assert_not account_detail.valid?, "Cannot save account detail without employee. Errors: #{account_detail.errors.to_a.to_sentence}"
  end

  test "Should not save account detail without total" do
    account_detail = AccountEmployeeDetail.new(account_employee_id:1, pay:0, employee_id:1, number_bill:0, certification_id:1, date:Date.today, state:"Pendiente" )
    assert_not account_detail.valid?, "Cannot save account detail without total. Errors: #{account_detail.errors.to_a.to_sentence}"
  end

  test "Should not save account detail without certification" do
    account_detail = AccountEmployeeDetail.new(account_employee_id:1, total:0, employee_id:1, number_bill:0, pay:1, date:Date.today, state:"Pendiente" )
    assert_not account_detail.valid?, "Cannot save account detail without certification. Errors: #{account_detail.errors.to_a.to_sentence}"
  end

  test "Should not save account detail without state" do
    account_detail = AccountEmployeeDetail.new(account_employee_id:1, total:0, employee_id:1, number_bill:0, pay:1, date:Date.today, certification_id:1 )
    assert_not account_detail.valid?, "Cannot save account detail without state. Errors: #{account_detail.errors.to_a.to_sentence}"
  end
end
