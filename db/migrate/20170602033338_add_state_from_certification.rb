class AddStateFromCertification < ActiveRecord::Migration[5.0]
  def change
    add_column :certifications, :state, :integer, default:0
  end
end
