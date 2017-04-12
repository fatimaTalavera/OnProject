class CreateCertificationDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :certification_details do |t|
      t.references :certification, foreign_key: true
      t.references :employee, foreign_key: true
      t.integer :quantity, default: 0
      t.decimal :pay, default: 75558
      t.decimal :discount, default: 0
      t.string :observation
      t.decimal :subtotal, default: 0

      t.timestamps
    end
  end
end
