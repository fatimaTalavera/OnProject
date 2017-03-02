class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :last_name
      t.integer :identification_document
      t.string :email
      t.string :adress
      t.string :phone

      t.timestamps
    end
  end
end
