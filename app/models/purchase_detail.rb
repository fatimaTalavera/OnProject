class PurchaseDetail < ApplicationRecord
  belongs_to :material
  belongs_to :purchase_bill, required: false
  before_create :sumar_material

  def sumar_material
    Material.update(self.material.id, quantity: self.material.quantity + self.quantity)
  end

  validates :quantity, :presence => {:message => "Debe rellenar este campo"},
  #valida que no sea negativo
  :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  validates :price, :presence => {:message => "Debe rellenar este campo"},
            #valida que no sea negativo
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  validates :material_id, :presence => {:message => "Debe seleccionar un material"}

  validates :purchase_bill_id, :presence => {:message => "Debe seleccionar una factura de compra"}

end