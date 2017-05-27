class AddStateToAccountEmployeeDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :account_employee_details, :state, :string
  end
end
