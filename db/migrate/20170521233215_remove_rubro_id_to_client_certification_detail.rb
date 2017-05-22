class RemoveRubroIdToClientCertificationDetail < ActiveRecord::Migration[5.0]
  def change
    remove_column :client_certification_details, :rubro_id
  end
end
