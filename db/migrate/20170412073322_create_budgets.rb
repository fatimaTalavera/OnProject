class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.references :client, foreign_key: true
      t.references :contract, foreign_key: true
      t.date :date
      t.string :description
      t.string :state
      t.integer :total_amount, default: 0.0, limit: 8

      t.timestamps
    end
  end
end
