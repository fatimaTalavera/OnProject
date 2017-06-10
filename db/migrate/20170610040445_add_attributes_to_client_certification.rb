class AddAttributesToClientCertification < ActiveRecord::Migration[5.0]
  def change
    add_column :client_certifications, :observations, :string
    add_column :client_certifications, :approved_by, :string
    add_column :client_certifications, :approved_date, :date
    remove_column :client_certifications, :state, :string
    add_column :client_certifications, :state, :integer, default: 0
    add_reference :sale_details, :client_certification, foreign_key: true
  end
end
