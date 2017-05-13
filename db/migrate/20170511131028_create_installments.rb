class CreateInstallments < ActiveRecord::Migration[5.0]
  def change
    create_table :installments do |t|
      t.references :sale_bill, foreign_key: true
      t.date :due_date
      t.integer :amount
      t.integer :balance

      t.timestamps
    end
  end
end
