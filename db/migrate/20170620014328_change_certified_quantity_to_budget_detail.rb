class ChangeCertifiedQuantityToBudgetDetail < ActiveRecord::Migration[5.0]
  def up
    change_column :budget_details, :certified_quantity, :float, default: 0.0
  end

  def down
    change_column :budget_details, :certified_quantity, :integer, default: 0
  end
end
