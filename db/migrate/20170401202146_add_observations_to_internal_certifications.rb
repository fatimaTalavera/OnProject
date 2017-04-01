class AddObservationsToInternalCertifications < ActiveRecord::Migration[5.0]
  def change
    add_column :internal_certifications, :observations, :string
  end
end
