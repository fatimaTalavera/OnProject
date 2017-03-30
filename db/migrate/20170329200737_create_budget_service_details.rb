class CreateBudgetServiceDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :budget_service_details do |t|
      t.references :budget, foreign_key: true
      t.references :service, foreign_key: true
      t.decimal :service_price, default: 0.0;
      t.decimal :service_quantity, default: 0.0;
      t.decimal :subtotal, default: 0.0;

      t.timestamps
    end
  end
end
