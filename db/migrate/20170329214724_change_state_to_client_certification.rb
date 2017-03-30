class ChangeStateToClientCertification < ActiveRecord::Migration[5.0]
  def change
    remove_column :client_certifications, :state, :boolean
    add_column :client_certifications, :state, :string
  end
end
