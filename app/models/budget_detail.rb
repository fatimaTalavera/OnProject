class BudgetDetail < ApplicationRecord
  belongs_to :budget
  belongs_to :rubro

  after_create :ac_subtotal
  validates :rubro_id, :presence => {:message => "Seleccione un rubro"}
  validates :quantity, :presence => {:message => "No puede estar vacio"}

  def ac_subtotal
    rubro = Rubro.find(self.rubro_id)
    subtotal = rubro.price * quantity
    self.update_attributes(subtotal: subtotal)
  end
end
