class SaleDetail < ApplicationRecord
  audited
  belongs_to :sale_bill, required: false
  before_create :set_total

  #Validaciones
  validates_numericality_of :quantity, :presence => {:message => "Debe rellenar este campo"},
                            :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 9999,
                            :message => "Ingrese un número positivo menor a 9999"

  #validates_numericality_of :price, :presence => {:message => "Debe rellenar este campo"},
  #                          :greater_than_or_equal_to => 1,
  #                          :less_than_or_equal_to => 2147483647,
  #                          :message => "Ingrese un número válido"
  validates :price, :presence => {:message => "Debe rellenar este campo"}
  validates :concept, :presence => {:message => "Debe rellenar este campo"}

  private
  def set_total
    self.total = self.price * self.quantity
    #self.sale_bill.update(total: self.sale_bill.total + self.total)
  end
end
