class RubroServiceDetail < ApplicationRecord
  belongs_to :service
  belongs_to :rubro, required: false
  before_create :calculate_subtotal
  before_update :sum_to_price

  validates_numericality_of :quantity, :presence => {:message => "Debe rellenar este campo"},
                            :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 9999,
                            :message => "Ingrese un número positivo menor a 9999"

  validates :service_id, :presence => {:message => "Debe seleccionar un servicio"}

  def calculate_subtotal
    self.subtotal = self.service.price * self.quantity
      self.rubro.update(price: self.rubro.price + self.subtotal)
  end

  def sum_to_price
    if self.subtotal_changed?
      @diferencia = self.subtotal - self.subtotal_was
      self.rubro.update(price: self.rubro.price + @diferencia)
    end
  end
end
