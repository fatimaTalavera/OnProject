class AddPurchaseBillIdToPurchaseDetails < ActiveRecord::Migration[5.0]
  def change
    add_reference :purchase_details, :purchase_bill, foreign_key: true
  end
end
