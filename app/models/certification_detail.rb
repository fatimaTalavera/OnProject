class CertificationDetail < ApplicationRecord
  belongs_to :certification
  belongs_to :employee
  delegate :name, to: :employee, prefix: true
  after_create :subtotal, :total

  validates :employee_id, :presence => {:message => "Seleccione un jornalero"}
  validates :quantity, :presence => {:message => "Ingrese cantidad"},
            :numericality => { :greater_than_or_equal_to => 0,
                               :less_than_or_equal_to => 365, message: "No puede ser negativo y debe ser menor o igual a 365"}

  validates :pay,  :presence => {:message => "Ingrese jornal"},
            :numericality => { :greater_than_or_equal_to => 0,
                               :less_than_or_equal_to => 9999999999, message: "No puede ser negativo y no puede ser mayor a 9.999.999.999"}

  validates :discount, :numericality => { :greater_than_or_equal_to => 0,
                                          :less_than_or_equal_to => 100, message: "No puede ser negativo y no puede ser mayor a 100%"}

  validates :observation, :length => {in: 0..200, :message => "Permite hasta 200 caracteres"}

  def subtotal
    subtotal = self.pay * self.quantity
    self.update_attribute(:subtotal, subtotal)
    return subtotal
  end

  def total
    subtotal = self.pay * self.quantity
    discount = subtotal * (self.discount/100)
    total = subtotal - discount
    self.update_attribute(:total, total)
    return total
  end

end
