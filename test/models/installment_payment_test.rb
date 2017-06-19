require 'test_helper'

class InstallmentPaymentTest < ActiveSupport::TestCase

  test "Should not save installment payment without data" do
    installmentPayment = InstallmentPayment.new()
    assert_not installmentPayment.valid?, "The installment payment was not valid. Errors: #{installmentPayment.errors.to_a.to_sentence}"
  end

  test "Should not save installment payment without amount" do
    installmentPayment = InstallmentPayment.new(installment_id: 1, date: "01/01/2000")
    assert_not installmentPayment.valid?, "The installment payment was not valid. Errors: #{installmentPayment.errors.to_a.to_sentence}"
  end

  test "Should not save installment payment without date" do
    installmentPayment = InstallmentPayment.new(installment_id: 1, amount: 1000)
    assert_not installmentPayment.valid?, "The installment payment was not valid. Errors: #{installmentPayment.errors.to_a.to_sentence}"
  end

  test "Should update balance of installment" do
    assert_equal(true,InstallmentPayment.first.restar_a_cuotas)
    assert_equal(0,InstallmentPayment.first.installment.balance)
  end

  test "Should update balance of sale_bill" do
    assert_equal(true, InstallmentPayment.first.restar_a_factura)
    assert_equal(9,InstallmentPayment.first.installment.sale_bill.balance)
  end

  test "Should update state of sale_bill with balance 0" do
    assert_equal(true, InstallmentPayment.last.restar_a_factura)
    assert_equal(0, InstallmentPayment.last.installment.sale_bill.balance)
    assert_equal("pagado", InstallmentPayment.last.installment.sale_bill.state)
  end


end
