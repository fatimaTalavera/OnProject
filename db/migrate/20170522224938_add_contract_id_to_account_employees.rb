class AddContractIdToAccountEmployees < ActiveRecord::Migration[5.0]
  def change
    add_reference :account_employees, :contract, foreign_key: true
  end
end
