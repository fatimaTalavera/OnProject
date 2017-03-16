class PurchaseDetail < ApplicationRecord
  belongs_to :material
  belongs_to :purchase_bill, required: false
  before_create :sumar_material

  def sumar_material
    Material.update(self.material.id, quantity: self.material.quantity + self.quantity)
  end
end