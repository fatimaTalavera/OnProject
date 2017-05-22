class CreateInstallmentPurchases< ActiveRecord::Migration[5.0]
  def change
    create_table :installment_purchases do |t|
      t.references :purchase_bills, foreign_key: true
      t.date :due_date
      t.integer :amount
      t.integer :balance

      t.timestamps
    end
  end
end
