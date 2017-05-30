require 'test_helper'

class InstallmentTest < ActiveSupport::TestCase

  test "Should not save installment without data" do
    installment = Installment.new()
    assert_not installment.valid?, "The installment was not valid. Errors: #{installment.errors.to_a.to_sentence}"
  end

  test "Should not save installment without sale bill" do
    installment = Installment.new(due_date: 01/01/2000, amount: 0, balance: 0)
    assert_not installment.valid?, "The installment was not valid. Errors: #{installment.errors.to_a.to_sentence}"
  end

  test "Should not save installment without due date" do
    installment = Installment.new(sale_bill_id: 1, amount: 0, balance: 0)
    assert_not installment.valid?, "The installment was not valid. Errors: #{installment.errors.to_a.to_sentence}"
  end

  test "Should not save installment without amount" do
    installment = Installment.new(sale_bill_id: 1, due_date: 01/01/2000, balance: 0)
    assert_not installment.valid?, "The installment was not valid. Errors: #{installment.errors.to_a.to_sentence}"
  end

  test "Should save installment without balance" do
    installment = Installment.new(sale_bill_id: 1, due_date: 01/01/2000, amount: 0)
    assert_not installment.valid?, "The installment was not valid. Errors: #{installment.errors.to_a.to_sentence}"
  end

end