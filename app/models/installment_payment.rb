class InstallmentPayment < ApplicationRecord
  belongs_to :installment
  #hacer logica de restar a cuotas
  before_create :restar_a_cuotas

  def restar_a_cuotas
    self.installment.update(balance: self.installment.balance - self.amount)
  end
end
