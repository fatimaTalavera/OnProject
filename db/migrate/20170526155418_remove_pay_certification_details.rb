class RemovePayCertificationDetails < ActiveRecord::Migration[5.0]
  def change
    remove_column :certification_details, :pay, :decimal
  end
end
