class CreateBudgetDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :budget_details do |t|
      t.references :budget, foreign_key: true
      t.references :rubro, foreign_key: true
      t.decimal :price, default: 0.0
      t.decimal :quantity, default: 0.0
      t.decimal :subtotal, default: 0.0
      t.integer :utility, default: 0

      t.timestamps
    end
  end
end
