class AddCostToBudgetDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :budget_details, :cost, :decimal
  end
end
