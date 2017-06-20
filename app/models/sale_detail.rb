class SaleDetail < ApplicationRecord
  audited
  belongs_to :sale_bill, required: false
  belongs_to :client_certification, required: false

  delegate :number, :received, :date, :total, to: :client_certification, prefix: true

  validates :client_certification_id, :presence => {:message => "Seleccione una certificación"}
end
