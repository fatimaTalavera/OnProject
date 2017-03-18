class PurchaseDetail < ApplicationRecord
  belongs_to :material
  belongs_to :purchase_bill, required: false
  before_create :sumar_material

  def sumar_material
    Material.update(self.material.id, quantity: self.material.quantity + self.quantity)
  end

  validates :quantity, :presence => {:message => "Debe rellenar este campo"}

  validates :material_id, :presence => {:message => "Debe seleccionar un material"}

end