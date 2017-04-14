class AddCurrentAvatarToCompanyConfigs < ActiveRecord::Migration[5.0]
  def change
    add_column :company_configs, :current_avatar, :string
  end
end
