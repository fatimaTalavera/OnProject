class CreateInstallmentPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :installment_payments do |t|
      t.references :installment, foreign_key: true
      t.integer :amount
      t.date :date

      t.timestamps
    end
  end
end
