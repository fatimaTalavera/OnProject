class AddPriceToRubro < ActiveRecord::Migration[5.0]
  def change
    add_column :rubros, :price, :integer
  end
end
