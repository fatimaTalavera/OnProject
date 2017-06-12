class RubroMaterialDetail < ApplicationRecord
  audited
  belongs_to :material
  belongs_to :rubro, required: false
  before_create :calculate_subtotal
  after_create_commit :calculate_price
  after_update_commit :sum_to_price_quantity
  before_update :sum_to_price_external

  validates :quantity, :presence => {:message => "No puede estar vacío"}
  validates :material_id, :presence => {:message => "Debe seleccionar un material"}
  validates :measurement_unit, :presence => {:message => "No puede estar vacío"}
  validates :quantity, :presence => {:message => "No puede estar vacío"}
  validates :price, :presence => {:message => "No puede estar vacío"}
  validates :subtotal, :presence =>true

  validate :valid_quant_num

  def calculate_subtotal
    self.subtotal = self.material.price * self.quantity
  end

  def calculate_price
    self.rubro.update(price: self.rubro.price + self.subtotal)
  end

  def sum_to_price_quantity
    if quantity_changed?
      self.subtotal = self.material.price * self.quantity
    end
  end

  def sum_to_price_external
    if self.subtotal_changed?
      @diferencia = self.subtotal - self.subtotal_was
      self.rubro.update(price: self.rubro.price + @diferencia)
    end
  end

  def valid_quant_num
    if quantity.nil? == true
      errors.add(:quantity, "No puede estar vacío")
    end
    if (quantity.nil? == false) and quantity <= 0
      errors.add(:quantity, "Debe ser mayor a 0")
    end
  end
end
