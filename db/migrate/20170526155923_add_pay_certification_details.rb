class AddPayCertificationDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :certification_details, :pay, :decimal
  end
end
