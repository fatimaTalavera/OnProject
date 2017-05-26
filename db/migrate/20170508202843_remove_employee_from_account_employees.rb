class RemoveEmployeeFromAccountEmployees < ActiveRecord::Migration[5.0]
  def change
    remove_column :account_employees, :employee_id, :integer
  end
end
