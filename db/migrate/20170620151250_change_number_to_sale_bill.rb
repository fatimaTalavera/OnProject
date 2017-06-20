class ChangeNumberToSaleBill < ActiveRecord::Migration[5.0]
  def up
    change_column :sale_bills, :number, :string
  end

  def down
    change_column :sale_bills, :number, :integer
  end
end
