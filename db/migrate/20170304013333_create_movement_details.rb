class CreateMovementDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :movement_details do |t|
      t.references :material_movement, foreign_key: true
      t.references :material, foreign_key: true
      t.float :cantidad

      t.timestamps
    end
  end
end
