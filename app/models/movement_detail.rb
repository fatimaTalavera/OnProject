class MovementDetail < ApplicationRecord
  belongs_to :material_movement, required: false
  belongs_to :material
  before_create :restar_material

  def restar_material
    Material.update(self.material.id, quantity: self.material.quantity - self.cantidad)
  end

  validates :cantidad, :presence => {:message => "Debe rellenar este campo"},
  #valida que no sea negativo
  :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  validates :material_id, :presence => {:message => "Debe seleccionar un material"}

  validates :material_movement_id, :presence => {:message => "Debe seleccionar un movimiento"}

end
