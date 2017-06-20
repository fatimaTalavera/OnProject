class AddExpectedGainToBudgets < ActiveRecord::Migration[5.0]
  def change
    add_column :budgets, :expected_gain, :bigint
  end
end
