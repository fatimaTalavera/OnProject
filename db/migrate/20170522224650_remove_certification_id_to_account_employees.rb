class RemoveCertificationIdToAccountEmployees < ActiveRecord::Migration[5.0]
  def change
    remove_column :account_employees, :certification_id, :integer
  end
end
