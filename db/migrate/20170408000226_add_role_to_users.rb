class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :role, index: true
    add_foreign_key :users, :roles
  end
end
