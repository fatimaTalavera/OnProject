class RemoveClientFromClientCertification < ActiveRecord::Migration[5.0]
  def change
    remove_column :client_certifications, :client_id, :integer
  end
end
