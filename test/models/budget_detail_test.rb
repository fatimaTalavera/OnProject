require 'test_helper'

class BudgetDetailTest < ActiveSupport::TestCase
  test "Should not save Budget detail without data" do
    budget_detail = BudgetDetail.new()
    assert_not budget_detail.valid?, "Cannot save Budget_detail without data. Errors: #{budget_detail.errors.to_a.to_sentence}"
  end

  test "Should not save budget detail without rubro" do
    budget_detail = BudgetDetail.new(price: 1, quantity: 1, subtotal: 99.9, utility: 20)
    assert_not budget_detail.valid?, "Cannot save Budget_detail without rubro. Errors: #{budget_detail.errors.to_a.to_sentence}"
  end

  test "Should not save budget detail without quantity" do
    budget_detail = BudgetDetail.new(rubro: Rubro.first, price: 1, subtotal: 99.9, utility: 20)
    assert_not budget_detail.valid?, "Cannot save Budget_detail without quantity. Errors: #{budget_detail.errors.to_a.to_sentence}"
  end

  test "Should update certified_quantity" do
    assert_equal(9, BudgetDetail.first.update_certified_quantity)
  end

end
