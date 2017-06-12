class AddSenderAndRemissionToMaterialMovement < ActiveRecord::Migration[5.0]
  def change
    add_column :material_movements, :sender, :string
    add_column :material_movements, :remission, :integer
  end
end
