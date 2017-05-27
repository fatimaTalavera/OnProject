class AddDataToRubroServiceDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :rubro_service_details, :price, :integer, default: 0
    add_column :rubro_service_details, :measurement_unit, :string
  end
end
