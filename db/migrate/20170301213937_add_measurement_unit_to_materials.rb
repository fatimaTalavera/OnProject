class AddMeasurementUnitToMaterials < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :measurement_unit, :string
  end
end
