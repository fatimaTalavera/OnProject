class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :last_name
      t.string :address
      t.string :email
      t.string :phone
      t.string :identification_document

      t.timestamps
    end
  end
end
