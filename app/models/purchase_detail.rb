class PurchaseDetail < ApplicationRecord
  audited
  belongs_to :material
  belongs_to :purchase_bill, required: false
  before_create :add_material

  after_validation :set_total
  def add_material
    Material.update(self.material.id, quantity: self.material.quantity + self.quantity)
  end

  validates_numericality_of :quantity, :presence => {:message => "Debe rellenar este campo"},
            :greater_than_or_equal_to => 1,
            :less_than_or_equal_to => 9999,
            :message => "Ingrese un número positivo menor a 9999"

  validates :price, :presence => {:message => "No puede estar en blanco"},
            :format => {:multiline => true, with: VALID_NUMBER_REGEX, :message => "Solo permite numeros"},
            #valida que no sea negativo
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  validates :material_id, :presence => {:message => "Debe seleccionar un material"}


  def set_total
    self.total = self.price.to_i * self.quantity.to_i
  end

end
