class MovementDetail < ApplicationRecord
  audited
  belongs_to :material_movement, required: false
  belongs_to :material
  delegate :contract_id, to: :material_movement, prefix: true
  #Delegate contract_id
  before_create :withdraw_material
  before_update :quantity_change

  def withdraw_material
    Material.update(self.material.id, quantity: self.material.quantity - self.quantity)
    calculate_subtotal
  end

  def quantity_change
    if self.quantity <  self.quantity_was
      Material.update(self.material.id, quantity: (self.material.quantity + (self.quantity_was - self.quantity)))
    else
      Material.update(self.material.id, quantity: (self.material.quantity - (self.quantity - self.quantity_was)))
    end
    calculate_subtotal
  end

  def calculate_subtotal
    self.subtotal = self.material.price * self.quantity
  end

  validates_numericality_of :quantity, :presence => {:message => "Debe rellenar este campo"},
                            :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 9999,
                            :message => "Ingrese un número menor a 9999"

  validates :material_id, :presence => {:message => "Debe seleccionar un material"}

  validates :price, :presence => {:message => "No puede estar en blanco"},
            :format => {:multiline => true, with: VALID_NUMBER_REGEX, :message => "Solo permite numeros"},
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  validate :quantity_is_available

  def quantity_is_available
    if self.material.nil?
      return
    end
    if self.quantity.nil?
      return
    end
    self.errors.add(:quantity, "Seleccione una cantidad disponible") unless self.material.quantity >= self.quantity
  end

  def total
    return self.price * self.quantity
  end
end

