class BudgetDetail < ApplicationRecord
  belongs_to :budget
  belongs_to :rubro

  delegate :name, to: :rubro, prefix: true
  delegate :measurement_unit, to: :rubro, prefix:true

  validates :rubro_id, presence: {message: "Seleccione un rubro"}
  validates :quantity, presence: {message: "No puede estar vacio"}
  validates :utility, presence: {message: "No puede estar vacio"}
  validate 'valid_utility_num'

  def valid_utility_num
    if utility <= 0
      errors.add(:utility, "Debe ser mayor a 0")
    end
    if utility >= 9999
      errors.add(:utility, "Debe ser menor a 9999")
    end
  end

end