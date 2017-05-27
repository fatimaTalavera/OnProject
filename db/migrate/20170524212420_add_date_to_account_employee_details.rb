class AddDateToAccountEmployeeDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :account_employee_details, :date, :date
  end
end
