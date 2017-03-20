require 'test_helper'

class PurchaseDetailTest < ActiveSupport::TestCase
  test "Should not save purchase detail without data" do
    purchaseDetail = PurchaseDetail.new()
    assert_not purchaseDetail.valid?, "The movement detail was not valid. Errors: #{purchaseDetail.errors.to_a.to_sentence}"
  end

  test "Should not save purchase detail without material" do
    purchaseDetail = PurchaseDetail.new(quantity: 1, price: 3, purchase_bill_id: 1)
    assert_not purchaseDetail.valid?, "The movement detail was not valid. Errors: #{purchaseDetail.errors.to_a.to_sentence}"
  end

  test "Should not save purchase detail without quantity" do
    purchaseDetail = PurchaseDetail.new(material_id: 1, price: 3, purchase_bill_id: 1)
    assert_not purchaseDetail.valid?, "The movement detail was not valid. Errors: #{purchaseDetail.errors.to_a.to_sentence}"
  end

  test "Should not save purchase detail with an invalid quantity" do
    purchaseDetail = PurchaseDetail.new(material_id: 1, quantity: -1, price: 3, purchase_bill_id: 1)
    assert_not purchaseDetail.valid?, "The movement detail was not valid. Errors: #{purchaseDetail.errors.to_a.to_sentence}"
  end

  test "Should not save purchase detail without price" do
    purchaseDetail = PurchaseDetail.new(material_id: 1, quantity: 1, purchase_bill_id: 1)
    assert_not purchaseDetail.valid?, "The movement detail was not valid. Errors: #{purchaseDetail.errors.to_a.to_sentence}"
  end

  test "Should not save purchase detail with an invalid price" do
    purchaseDetail = PurchaseDetail.new(material_id: 1, quantity: 1, price: -3, purchase_bill_id: 1)
    assert_not purchaseDetail.valid?, "The movement detail was not valid. Errors: #{purchaseDetail.errors.to_a.to_sentence}"
  end

  test "Should not save purchase detail without Purchase Bill" do
    purchaseDetail = PurchaseDetail.new(material_id: 1, quantity: 1, price: 3)
    assert_not purchaseDetail.valid?, "The movement detail was not valid. Errors: #{purchaseDetail.errors.to_a.to_sentence}"
  end
end
