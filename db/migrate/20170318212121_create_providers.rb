class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :ruc
      t.string :address
      t.string :phone
      t.string :email
      t.boolean :state
      t.integer :balance, default: 0, limit: 8

      t.timestamps
    end
  end
end
