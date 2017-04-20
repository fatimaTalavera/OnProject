class AddStateToCertification < ActiveRecord::Migration[5.0]
  def change
    add_column :certifications, :state, :string
  end
end
