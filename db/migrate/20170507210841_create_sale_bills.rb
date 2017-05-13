class CreateSaleBills < ActiveRecord::Migration[5.0]
  def change
    create_table :sale_bills do |t|
      t.date :date
      t.string :condition
      t.integer :number
      t.references :client, foreign_key: true
      t.references :contract, foreign_key: true
      t.integer :total, default: 0
      t.integer :balance, default: 0

      t.timestamps
    end
  end
end
