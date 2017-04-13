class AddPriceToMovementDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :movement_details, :price, :decimal
  end
end
