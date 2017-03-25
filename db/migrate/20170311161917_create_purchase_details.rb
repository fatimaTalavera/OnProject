class CreatePurchaseDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_details do |t|
      t.references :material, foreign_key: true
      t.integer :quantity, default: 1
      t.integer :price

      t.timestamps
    end
  end
end
