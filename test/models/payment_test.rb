require 'test_helper'
class PaymentTest < ActiveSupport::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @purchase_bill = PurchaseBill.new(date: '01-01-2000', number: 123, provider_id: 1, total:100,condition:0)
    @purchase_detail = PurchaseDetail.new(material_id: 1, quantity: 1, price: 3, purchase_bill_id: @purchase_bill.id)
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  test "Should new payment of purchase_bill" do
    assert_equal(true,@purchase_bill.set_payment)
  end

  test "Should change state of purchase" do
    assert_equal(:pagado, @purchase_bill.set_state)
  end

  test "Should change balance" do
    assert_equal(100, @purchase_bill.set_balance)
  end

  test "Should calculate total in detail" do
    assert_equal(3, @purchase_detail.set_total)
  end
end