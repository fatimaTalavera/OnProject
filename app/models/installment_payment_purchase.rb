class InstallmentPaymentPurchase < ApplicationRecord
  belongs_to :installment_purchase
  delegate :amount, to: :installment_purchase, prefix: true

  before_create :restar_a_cuotas
  before_create :restar_a_factura

  def restar_a_cuotas
    self.installment_purchase.update(balance: self.installment_purchase.balance - self.amount)
  end

  def restar_a_factura
    purchase_bill = PurchaseBill.find(self.installment_purchase.purchase_bill.id)
    new_purchase_bill_balance = purchase_bill.balance - self.amount
    purchase_bill.update_attribute(:balance, new_purchase_bill_balance)
    create_payment()
    update_state(purchase_bill)
  end

  def update_state(purchase_bill)
    if purchase_bill.balance == 0
      purchase_bill.update_attribute(:state, "pagado")
    end
  end

  def create_payment
    payment = Payment.new
    payment.date = Time.zone.now
    payment.amount = self.amount
    payment.purchase_bill_id = self.installment_purchase.purchase_bill.id
    payment.save()
  end

end
