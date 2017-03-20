require 'test_helper'

class PurchaseBillTest < ActiveSupport::TestCase
  test "Should not save purchase bill without data" do
    purchaseBill = PurchaseBill.new()
    assert_not purchaseBill.valid?, "The purchase bill was not valid. Errors: #{purchaseBill.errors.to_a.to_sentence}"
  end

  test "Should not save material movement without condition" do
    purchaseBill = PurchaseBill.new(date: '01-01-2000', number: 123)
    assert_not purchaseBill.valid?, "The purchase bill was not valid. Errors: #{purchaseBill.errors.to_a.to_sentence}"
  end

  test "Should not save material movement without number" do
    purchaseBill = PurchaseBill.new(date: '01-01-2000')
    assert_not purchaseBill.valid?, "The purchase bill was not valid. Errors: #{purchaseBill.errors.to_a.to_sentence}"
  end

  test "Should not save material movement without date" do
    purchaseBill = PurchaseBill.new(number: 123)
    assert_not purchaseBill.valid?, "The purchase bill was not valid. Errors: #{purchaseBill.errors.to_a.to_sentence}"
  end
end