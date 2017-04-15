class AddmeasurementUnitToRubro < ActiveRecord::Migration[5.0]
  def change
    add_column :rubros, :measurement_unit, :string
  end
end
