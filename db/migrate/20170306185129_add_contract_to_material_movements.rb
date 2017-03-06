class AddContractToMaterialMovements < ActiveRecord::Migration[5.0]
  def change
    add_reference :material_movements, :contract, foreign_key: true
  end
end
