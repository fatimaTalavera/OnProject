class AddCurrentAvatarToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_avatar, :string
  end
end
