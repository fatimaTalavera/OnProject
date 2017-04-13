class BudgetDetail < ApplicationRecord
  belongs_to :budget
  belongs_to :rubro

  delegate :name, to: :rubro, prefix: true

  after_create :ac_subtotal
  validates :rubro_id, :presence => {:message => "Seleccione un rubro"}
  validates :quantity, :presence => {:message => "No puede estar vacio"}
  validate :valid_utility

  def valid_utility
    if utility <= 0
      errors.add(:utility, "Debe ser mayor a 0")
    end
    if utility > 9999
      errors.add(:utility, "Debe ser menor a 9999")
    end
  end

  def ac_subtotal
    rubro = Rubro.find(self.rubro_id)
    subtotal = rubro.price * quantity
    self.update_attributes(subtotal: subtotal)
  end
end
