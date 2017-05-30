class InstallmentPayment < ApplicationRecord
  audited
  belongs_to :installment
  delegate :amount, to: :installment, prefix: true
  #hacer logica de restar a cuotas
  before_create :restar_a_cuotas
  before_create :restar_a_factura

  def restar_a_cuotas
    self.installment.update(balance: self.installment.balance - self.amount)
  end

  def restar_a_factura
    sale_bill = SaleBill.find(self.installment.sale_bill.id)
    new_sale_bill_balance = sale_bill.balance - self.amount
    sale_bill.update_attribute(:balance, new_sale_bill_balance)
    update_state(sale_bill)
  end

  def update_state(sale_bill)
    if sale_bill.balance == 0
      sale_bill.update_attribute(:state, "pagado")
    end
  end
end
