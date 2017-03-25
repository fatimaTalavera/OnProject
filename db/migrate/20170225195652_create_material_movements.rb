class CreateMaterialMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :material_movements do |t|
      t.date :fecha,  default: Time.now
      t.string :motivo

      t.timestamps
    end
  end
end
