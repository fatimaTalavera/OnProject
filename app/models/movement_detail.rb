class MovementDetail < ApplicationRecord
  belongs_to :material_movement, required: false
  belongs_to :material
  before_create :restar_material

  def restar_material
      Material.update(self.material.id, quantity: self.material.quantity - self.cantidad)
  end

  validates :cantidad, :presence => {:message => "Debe rellenar este campo"},
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo", :less_than_or_equal_to => 2147483647, message: "No puede ser un número tan grande"}

  validates :material_id, :presence => {:message => "Debe seleccionar un material"}

  validate :quantity_is_available

  def quantity_is_available
    if self.material.nil?
      return
    end
    if self.cantidad.nil?
      return
    end
    self.errors.add(:cantidad, "Seleccione una cantidad disponible") unless self.material.quantity >= self.cantidad
  end
end
