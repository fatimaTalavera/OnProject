class AddDataToBudgetDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :budget_details, :certified_quantity, :integer
    add_column :budget_details, :state, :integer, default: 0, null: false
  end
end
