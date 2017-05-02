class AddBudgetRefToContracts < ActiveRecord::Migration[5.0]
  def change
    add_reference :contracts, :budget, foreign_key: true
  end
end
