class MovementDetail < ApplicationRecord
  belongs_to :material_movement, required: false
  belongs_to :material
  before_save :restar_material

  def restar_material
    if(self.material.quantity >= self.cantidad)
      Material.update(self.material.id, quantity: self.material.quantity - self.cantidad)
    else
      errors.add(:base, "Superó la cantidad")
      throw :abort
    end
  end

  validates :cantidad, :presence => {:message => "Debe rellenar este campo"},
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"},
            :numericality => {:less_than_or_equal_to => 2147483647, message: "No puede ser un número tan grande"}

  validates :material_id, :presence => {:message => "Debe seleccionar un material"}

end
