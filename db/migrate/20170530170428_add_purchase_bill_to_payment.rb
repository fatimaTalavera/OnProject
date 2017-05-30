class AddPurchaseBillToPayment < ActiveRecord::Migration[5.0]
  def change
    remove_reference :payments, :purchase_bills, foreign_key: true
    remove_reference :installment_purchases, :purchase_bills, foreign_key: true
    add_reference :payments, :purchase_bill, foreign_key: true
    add_reference :installment_purchases, :purchase_bill, foreign_key: true
  end
end
