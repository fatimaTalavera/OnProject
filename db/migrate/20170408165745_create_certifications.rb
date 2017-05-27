class CreateCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :certifications do |t|
      t.date :date
      t.references :contract, foreign_key: true
      t.integer :total
      t.timestamps
    end
  end
end
