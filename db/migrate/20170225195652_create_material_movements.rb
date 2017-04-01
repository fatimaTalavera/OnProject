class CreateMaterialMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :material_movements do |t|
      t.date :date,  default: -> { 'CURRENT_DATE' }
      t.string :reason

      t.timestamps
    end
  end
end
