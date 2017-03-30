class CreateClientCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :client_certifications do |t|
      t.references :client, foreign_key: true
      t.references :contract, foreign_key: true
      t.date :date
      t.boolean :state
      t.string :observation
      t.string :received

      t.timestamps
    end
  end
end
