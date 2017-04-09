class RubroServiceDetail < ApplicationRecord
  belongs_to :service
  belongs_to :rubro, required: false
  before_create :calculate_subtotal
  before_update :sum_to_price

  def calculate_subtotal
    self.subtotal = self.service.price * self.quantity
      self.rubro.update(price: self.rubro.price + self.subtotal)
  end

  def sum_to_price
    if self.subtotal_changed?
      @diferencia = self.subtotal - self.subtotal_was
      self.rubro.update(price: self.rubro.price + @diferencia)
    end
  end
end
