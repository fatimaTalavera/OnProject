class CreateInternalCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_certifications do |t|
      t.date :date,  default: Time.now
      t.float :amount
      t.float :discount, default: 0
      t.references :employee, foreign_key: true
      t.references :contract, foreign_key: true

      t.timestamps
    end
  end
end
