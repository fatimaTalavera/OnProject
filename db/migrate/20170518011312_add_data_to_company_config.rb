class AddDataToCompanyConfig < ActiveRecord::Migration[5.0]
  def change
    add_column :company_configs, :letterhead, :string
    add_column :company_configs, :validity_of_letterhead, :date
    add_column :company_configs, :current_pay, :decimal, default: 0.0
    add_column :company_configs, :default_utility, :decimal, default: 0.0
  end
end
