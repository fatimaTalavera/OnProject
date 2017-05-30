class CreateRubroServiceDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :rubro_service_details do |t|
      t.references :rubro, foreign_key: true
      t.references :service, foreign_key: true
      t.float :quantity
      t.integer :subtotal
      t.timestamps
    end
  end
end
