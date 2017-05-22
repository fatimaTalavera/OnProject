class CreateSaleDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :sale_details do |t|
      t.references :sale_bill, foreign_key: true
      t.string :concept
      t.integer :price
      t.integer :quantity
      t.integer :total, default: 0

      t.timestamps
    end
  end
end
