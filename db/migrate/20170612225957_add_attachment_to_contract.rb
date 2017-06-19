class AddAttachmentToContract < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :attachment, :string
  end
end
