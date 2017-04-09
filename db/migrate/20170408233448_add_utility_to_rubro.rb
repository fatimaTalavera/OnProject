class AddUtilityToRubro < ActiveRecord::Migration[5.0]
  def change
    add_column :rubros, :utility, :float
  end
end
