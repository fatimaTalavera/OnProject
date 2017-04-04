class CreateClientCertificationDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :client_certification_details do |t|
      t.references :client_certification, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
