require 'test_helper'

class PurchaseBillTest < ActiveSupport::TestCase
  test "Should not save purchase bill without data" do
    purchaseBill = PurchaseBill.new()
    assert_not purchaseBill.valid?, "The purchase bill was not valid. Errors: #{purchaseBill.errors.to_a.to_sentence}"
  end

  test "Should not save purchase bill without condition" do
    purchaseBill = PurchaseBill.new(date: '01-01-2000', number: 123, provider_id: 1)
    assert_not purchaseBill.valid?, "The purchase bill was not valid. Errors: #{purchaseBill.errors.to_a.to_sentence}"
  end

  test "Should not save purchase bill without number" do
    purchaseBill = PurchaseBill.new(date: '01-01-2000', provider_id: 1)
    assert_not purchaseBill.valid?, "The purchase bill was not valid. Errors: #{purchaseBill.errors.to_a.to_sentence}"
  end

  test "Should not save purchase bill without date" do
    purchaseBill = PurchaseBill.new(number: 123, provider_id: 1)
    assert_not purchaseBill.valid?, "The purchase bill was not valid. Errors: #{purchaseBill.errors.to_a.to_sentence}"
  end

  test "Should not save purchase bill without provider" do
    purchaseBill = PurchaseBill.new(number: 123, date: '01-01-2000')
    assert_not purchaseBill.valid?, "The purchase bill was not valid. Errors: #{purchaseBill.errors.to_a.to_sentence}"
  end
end