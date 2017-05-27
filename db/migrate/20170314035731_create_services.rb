class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.string :measurement_unit
      t.integer :price

      t.timestamps
    end
  end
end
