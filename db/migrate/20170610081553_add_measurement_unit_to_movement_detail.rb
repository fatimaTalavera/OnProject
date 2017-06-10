class AddMeasurementUnitToMovementDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :movement_details, :measurement_unit, :string
    add_column :movement_details, :subtotal, :integer
    add_column :material_movements, :total, :integer
  end
end
