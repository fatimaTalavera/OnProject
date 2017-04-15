class RemoveTotalFromCertification < ActiveRecord::Migration[5.0]
  def change
    remove_column :certifications, :total, :decimal
  end
end
