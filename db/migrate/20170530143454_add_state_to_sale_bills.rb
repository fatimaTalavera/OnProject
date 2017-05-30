class AddStateToSaleBills < ActiveRecord::Migration[5.0]
  def change
    add_column :sale_bills, :state, :string
  end
end
