class ChangeIdentificationDocumentToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :ruc, :string
    remove_column :clients, :identification_document, :integer
  end
end
