class BudgetDetail < ApplicationRecord
  belongs_to :budget
  belongs_to :rubro

  delegate :name, to: :rubro, prefix: true
  delegate :measurement_unit, to: :rubro, prefix:true

  validates :rubro_id, :presence => {:message => "Seleccione un rubro"}
  validates :quantity, :presence => {:message => "No puede estar vacio"}

end