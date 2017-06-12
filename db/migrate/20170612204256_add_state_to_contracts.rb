class AddStateToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :state, :string, default: 'activo'
  end
end
