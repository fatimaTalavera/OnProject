class AddTotalToPurchaseBills < ActiveRecord::Migration[5.0]
  def change
    add_column :purchase_bills, :total, :integer
  end
end
