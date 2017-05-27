class CreateCertificationDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :certification_details do |t|
      t.references :certification, foreign_key: true
      t.references :employee, foreign_key: true
      t.float :quantity, default: 0
      t.integer :pay, default: 75558
      t.integer :discount, default: 0
      t.string :observation
      t.integer :subtotal, default: 0

      t.timestamps
    end
  end
end
