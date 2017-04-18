class AddMeasurementUnitToBudgetDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :budget_details, :measurement_unit, :string
  end
end
