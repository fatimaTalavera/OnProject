class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :purchase_bills, foreign_key: true
      t.date :date
      t.integer :amount
      t.integer :balance
    end
  end
end
