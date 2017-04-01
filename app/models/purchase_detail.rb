class PurchaseDetail < ApplicationRecord
  belongs_to :material
  belongs_to :purchase_bill, required: false
  before_create :add_material

  def add_material
    Material.update(self.material.id, quantity: self.material.quantity + self.quantity)
  end

  validates :quantity, :presence => {:message => "Debe rellenar este campo"},
            :numericality => {inclusion: 1..2147483647, message: "Ingrese un número válido"}

  validates :price, :presence => {:message => "Debe rellenar este campo"},
            #valida que no sea negativo
            :numericality => {inclusion: 1..2147483647, message: "Ingrese un número válido"}

  validates :material_id, :presence => {:message => "Debe seleccionar un material"}

end