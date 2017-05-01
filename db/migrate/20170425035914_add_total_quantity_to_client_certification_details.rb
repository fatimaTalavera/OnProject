class AddTotalQuantityToClientCertificationDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :client_certification_details, :total_quantity, :float
  end
end
