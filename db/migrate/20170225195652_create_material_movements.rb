class CreateMaterialMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :material_movements do |t|
      t.date :fecha
      t.string :motivo

      t.timestamps
    end
  end
end
