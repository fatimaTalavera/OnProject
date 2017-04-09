class CreateRubros < ActiveRecord::Migration[5.0]
  def change
    create_table :rubros do |t|
      t.references :material, foreign_key: true
      t.references :service, foreign_key: true
      t.integer :material_quantity
      t.integer :service_quantity
      t.string :name

      t.timestamps
    end
  end
end
