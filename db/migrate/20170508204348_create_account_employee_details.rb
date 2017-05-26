class CreateAccountEmployeeDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :account_employee_details do |t|
      t.references :account_employee, foreign_key: true
      t.references :employee, foreign_key: true
      t.integer :total
      t.string :pay
      t.integer :number_bill

      t.timestamps
    end
  end
end
