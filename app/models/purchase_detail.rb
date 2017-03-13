class PurchaseDetail < ApplicationRecord
  belongs_to :material
  belongs_to :purchase_bill, required: false
end
