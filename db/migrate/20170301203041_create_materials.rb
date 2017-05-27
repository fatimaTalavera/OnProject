class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :quantity
      t.integer :minimun_stock, default: 0

      t.timestamps
    end
  end
end
