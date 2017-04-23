class AddTotalToPurchaseDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :purchase_details, :total, :integer
  end
end
