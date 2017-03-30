class CreateBudgetMaterialDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :budget_material_details do |t|
      t.references :budget, foreign_key: true
      t.references :material, foreign_key: true
      t.decimal :material_price, default: 0.0;
      t.decimal :material_quantity, default: 0.0;
      t.decimal :subtotal, default: 0.0;

      t.timestamps
    end
  end
end
