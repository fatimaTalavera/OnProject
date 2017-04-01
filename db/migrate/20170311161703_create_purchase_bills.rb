class CreatePurchaseBills < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_bills do |t|
      t.datetime :date,  default: -> { 'CURRENT_DATE' }
      t.string :condition
      t.integer :number

      t.timestamps
    end
  end
end
