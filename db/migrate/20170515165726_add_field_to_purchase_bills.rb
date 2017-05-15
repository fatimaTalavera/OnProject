class AddFieldToPurchaseBills < ActiveRecord::Migration[5.0]
  def change
    add_column :purchase_bills, :state, :string
    add_column :purchase_bills, :balance, :integer, :default => 0
  end
end
