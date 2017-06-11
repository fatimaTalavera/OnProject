class AddCertificationNumberFromCertifications < ActiveRecord::Migration[5.0]
  def change
    add_column :certifications, :certification_number, :integer
  end
end
