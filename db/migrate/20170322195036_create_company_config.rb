class CreateCompanyConfig < ActiveRecord::Migration[5.0]
  def change
    create_table :company_configs do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :tel_fax
      t.string :celphone
      t.string :avatar

      t.timestamps null: false
    end
  end
end
