require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  test "Should not save a budget without data" do
    budget = Budget.new()
    assert_not budget.valid?, "Cannot save budget without data. Errors: #{budget.errors.to_a.to_sentence}"
  end

  test "Should not save budget without client" do
    budget = Budget.new(date: Date.today, state: 0)
    assert_not budget.valid?, "Cannot save a budget without client. Errors: #{budget.errors.to_a.to_sentence}"
  end

  test "Should not save budget without date" do
    budget = Budget.new(client: Client.first, state: 0)
    assert_not budget.valid?, "Cannot save a budget without date. Errors: #{budget.errors.to_a.to_sentence}"
  end
end
