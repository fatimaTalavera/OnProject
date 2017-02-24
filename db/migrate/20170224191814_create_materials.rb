class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.string :nombre
      t.string :descripcion
      t.string :unidad_medida
      t.decimal :cantidad
      t.decimal :precio
      t.integer :stock_minimo

      t.timestamps
    end
  end
end
