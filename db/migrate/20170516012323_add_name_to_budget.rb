class AddNameToBudget < ActiveRecord::Migration[5.0]
  def change
    add_column :budgets, :name, :string
    remove_column :budgets, :state, :string
    add_column :budgets, :state, :integer, default: 0, null: false
  end
end
