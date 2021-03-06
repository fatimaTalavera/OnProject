class RubroServiceDetail < ApplicationRecord
  audited
  belongs_to :service
  belongs_to :rubro, required: false

  before_save :calculate_subtotal
  after_create_commit :calculate_price
  after_update :sum_to_external_price
  after_destroy :sub_to_external_price

  validates :quantity, :presence => {:message => "No puede estar vacío"}
  validates :service_id, :presence => {:message => "Debe seleccionar un servicio"}
  validates :measurement_unit, :presence => {:message => "No puede estar vacío"}
  validates :quantity, :presence => {:message => "No puede estar vacío"}
  validates :price, :presence => {:message => "No puede estar vacío"}


  validate :valid_quant_num

  def calculate_subtotal
    self.subtotal = self.service.price * self.quantity
  end

  def calculate_price
    self.rubro.update_attribute(:price, self.rubro.price + self.subtotal)

  end

  def sum_to_external_price
    if self.subtotal_changed?
      @diferencia = self.subtotal - self.subtotal_was
      self.rubro.update_attribute(:price, self.rubro.price + @diferencia)
    end
  end

  def sub_to_external_price
    self.rubro.update_attribute(:price, self.rubro.price - self.subtotal)
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
