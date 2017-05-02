class AddBalanceFromEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :balance, :decimal, :precision =>15, :scale =>2, default:0
  end
end
