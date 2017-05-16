class BudgetDetail < ApplicationRecord
  audited
  belongs_to :budget
  belongs_to :rubro

  delegate :name, to: :rubro, prefix: true
  delegate :measurement_unit, to: :rubro, prefix:true

  validates :rubro_id, presence: {message: "Seleccione un rubro"}

  validate 'valid_utility_num'
  validate 'valid_quant_num'

  def valid_utility_num
    if utility.nil? == true
      errors.add(:utility, "No puede estar vacío")
    end
    if (utility.nil? == false) and utility < 0
      errors.add(:utility, "Debe ser mayor o igual a 0")
    end
    if (utility.nil? == false) and utility >= 9999
      errors.add(:utility, "Debe ser menor a 9999")
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