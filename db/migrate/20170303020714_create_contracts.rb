class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.references :client, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
