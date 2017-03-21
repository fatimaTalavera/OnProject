class AddProviderToPurchaseBill < ActiveRecord::Migration[5.0]
  def change
    add_reference :purchase_bills, :provider, foreign_key: true
  end
end
