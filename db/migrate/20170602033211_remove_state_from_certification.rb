class RemoveStateFromCertification < ActiveRecord::Migration[5.0]
  def change
    remove_column :certifications, :state, :string
  end
end
