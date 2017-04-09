class CreateRubroMaterialDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :rubro_material_details do |t|
      t.references :rubro, foreign_key: true
      t.references :material, foreign_key: true
      t.integer :quantity
      t.integer :subtotal
      t.timestamps
    end
  end
end
