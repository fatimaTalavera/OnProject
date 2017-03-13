class PurchaseBill < ApplicationRecord
  has_many :purchase_details
  accepts_nested_attributes_for :purchase_details, allow_destroy: true
  before_create :crear_fecha

  def crear_fecha
    self.date = Time.zone.now
  end
end
