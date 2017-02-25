class CreateMovementDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :movement_details do |t|
      t.integer :material_movement_id
      t.float :cantidad

      t.timestamps
    end
  end
end
