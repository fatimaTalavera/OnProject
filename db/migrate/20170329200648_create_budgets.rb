class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.references :client, foreign_key: true
      t.date :date
      t.string :description
      t.decimal :utility
      t.string :state
      t.decimal :total_service, default: 0.0;
      t.decimal :total_material, default: 0.0;
      t.decimal :total_amount, default: 0.0;

      t.timestamps
    end
  end
end
