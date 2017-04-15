class RubroMaterialDetail < ApplicationRecord
  belongs_to :material
  belongs_to :rubro, required: false
  before_create :calculate_subtotal
  before_update :sum_to_price

  validates_numericality_of :quantity, :presence => {:message => "Debe rellenar este campo"},
                            :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 9999,
                            :message => "Ingrese un número positivo menor a 9999"

  validates :material_id, :presence => {:message => "Debe seleccionar un material"}

  def calculate_subtotal
    self.subtotal = self.material.price * self.quantity
    self.rubro.update(price: self.rubro.price + self.subtotal)
  end

  def sum_to_price
    if quantity_changed?
      self.subtotal = self.material.price * self.quantity
    end
    if self.subtotal_changed?
      @diferencia = self.subtotal - self.subtotal_was
      self.rubro.update(price: self.rubro.price + @diferencia)
    end
  end
end
