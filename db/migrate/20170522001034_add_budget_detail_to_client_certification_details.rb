class AddBudgetDetailToClientCertificationDetails < ActiveRecord::Migration[5.0]
  def change
    add_reference :client_certification_details, :budget_detail, foreign_key: true
  end
end
