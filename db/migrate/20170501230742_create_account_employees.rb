class CreateAccountEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :account_employees do |t|
      t.integer :certification_id
      t.integer :employee_id
      t.integer :number_bill
      t.integer :pay
      t.date :date

      t.timestamps
    end
  end
end
