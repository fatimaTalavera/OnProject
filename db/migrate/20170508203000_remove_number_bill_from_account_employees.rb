class RemoveNumberBillFromAccountEmployees < ActiveRecord::Migration[5.0]
  def change
    remove_column :account_employees, :number_bill, :integer
  end
end
