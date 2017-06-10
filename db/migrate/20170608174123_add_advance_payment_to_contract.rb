class AddAdvancePaymentToContract < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :advance_payment, :integer, default: 0
    add_column :contracts, :advance_payment_date, :date
    add_column :contracts, :advance_payment_voucher, :string
    add_column :contracts, :advance_payment_percentage, :float, default: 0.0
    add_column :contracts, :has_advance_payment, :boolean
  end
end
