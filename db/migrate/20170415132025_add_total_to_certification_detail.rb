class AddTotalToCertificationDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :certification_details, :total, :decimal
  end
end
