class InstallmentPayment < ApplicationRecord
  audited
  belongs_to :installment
  delegate :amount, to: :installment, prefix: true
  #hacer logica de restar a cuotas
  before_create :restar_a_cuotas

  def restar_a_cuotas
    self.installment.update(balance: self.installment.balance - self.amount)
  end
end
