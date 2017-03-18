class MovementDetail < ApplicationRecord
  belongs_to :material_movement, required: false
  belongs_to :material
  before_create :restar_material

  def restar_material
    Material.update(self.material.id, quantity: self.material.quantity - self.cantidad)
  end

  validates :cantidad, :presence => {:message => "Debe rellenar este campo"}

  validates :material_id, :presence => {:message => "Debe seleccionar un material"}

end
