class MovementDetail < ApplicationRecord
  belongs_to :material_movement, required: false
  belongs_to :material
  before_create :withdraw_material

  def withdraw_material
      Material.update(self.material.id, quantity: self.material.quantity - self.quantity)
  end

  validates_numericality_of :quantity, :presence => {:message => "Debe rellenar este campo"},
                            :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 9999,
                            :message => "Ingrese un número menor a 9999"

  validates :material_id, :presence => {:message => "Debe seleccionar un material"}

  validate :quantity_is_available

  def quantity_is_available
    if self.material.nil?
      return
    end
    if self.quantity.nil?
      return
    end
    self.errors.add(:quantity, "Seleccione una cantidad disponible") unless self.material.quantity >= self.quantity
  end

  def total
    return self.price * self.quantity
  end
end
