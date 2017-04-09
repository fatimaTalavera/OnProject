class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.string :subject_class
      t.text :action, array: true, default: []
      t.integer :role_id

      t.timestamps
    end
    add_index :permissions, :role_id
  end
end
