class Installment < ApplicationRecord
  belongs_to :sale_bill

  before_create :set_balance

  #Validaciones
  validates_numericality_of :amount, :presence => {:message => "Debe rellenar este campo"},
                            :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 2147483647,
                            :message => "Ingrese un número válido"

  validates :due_date, :presence => {:message => "No puede estar en blanco"}

  private
  def set_balance
    self.balance = self.amount
  end
end