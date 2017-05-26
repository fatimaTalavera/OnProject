class AddCertificationIdToAccountEmployeeDetails < ActiveRecord::Migration[5.0]
  def change
    add_reference :account_employee_details, :certification, foreign_key: true
  end
end
