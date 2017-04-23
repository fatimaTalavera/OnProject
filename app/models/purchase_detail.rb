class PurchaseDetail < ApplicationRecord
  audited
  belongs_to :material
  belongs_to :purchase_bill, required: false
  before_create :add_material

  def add_material
    Material.update(self.material.id, quantity: self.material.quantity + self.quantity)
  end

  validates_numericality_of :quantity, :presence => {:message => "Debe rellenar este campo"},
            :greater_than_or_equal_to => 1,
            :less_than_or_equal_to => 9999,
            :message => "Ingrese un número menor a 9999"

  validates_numericality_of :price, :presence => {:message => "Debe rellenar este campo"},
            :greater_than_or_equal_to => 1,
            :less_than_or_equal_to => 2147483647,
            :message => "Ingrese un número válido"

  validates :material_id, :presence => {:message => "Debe seleccionar un material"}

end