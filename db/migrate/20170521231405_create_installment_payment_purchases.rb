class CreateInstallmentPaymentPurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :installment_payment_purchases do |t|
      t.references :installment_purchase, foreign_key: true
      t.integer :amount
      t.date :date

      t.timestamps
    end
  end
end
