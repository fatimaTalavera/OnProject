class BudgetMaterialDetail < ApplicationRecord
  belongs_to :budget
  belongs_to :material
end
