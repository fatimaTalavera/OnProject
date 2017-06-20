class AddNumberToClientCertification < ActiveRecord::Migration[5.0]
  def change
    add_column :client_certifications, :number, :string
    add_column :client_certifications, :total, :integer
  end
end
