class BudgetMaterialDetail < ApplicationRecord
  belongs_to :budget
  belongs_to :material

  after_create :ac_subtotal

  validates :material_id, :presence => {:message => "Seleccione material"}
  validates :material_quantity, :presence => {:message => "No puede estar en blanco"}

  def ac_subtotal
    material = Material.find(self.material_id)
    subtotal = material.price * material_quantity
    self.update_attributes(subtotal: subtotal)
  end
end
