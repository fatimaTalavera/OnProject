class SaleDetail < ApplicationRecord
  belongs_to :sale_bill, required: false
  belongs_to :concept
  before_create :set_total

  #Validaciones
  validates_numericality_of :quantity, :presence => {:message => "Debe rellenar este campo"},
                            :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 9999,
                            :message => "Ingrese un número positivo menor a 9999"

  validates_numericality_of :price, :presence => {:message => "Debe rellenar este campo"},
                            :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 2147483647,
                            :message => "Ingrese un número válido"

  validates :concept_id, :presence => {:message => "Debe seleccionar un concepto"}

  private
  def set_total
    self.total = self.price * self.quantity
    self.sale_bill.update(total: self.sale_bill.total + self.total)
  end
end
