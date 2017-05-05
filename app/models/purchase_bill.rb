class PurchaseBill < ApplicationRecord
  audited
  belongs_to :provider
  delegate :name, :ruc, to: :provider, prefix: true

  has_many :purchase_details

  after_validation :set_total

  accepts_nested_attributes_for :purchase_details, allow_destroy: true

  validates :condition, :presence => {:message => "Debe seleccionar una condicion de pago"}

  validates_numericality_of :number, :presence => {:message => "Debe rellenar este campo"},
                            :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 2147483647,
                            :message => "Ingrese un número válido"

  validates :date, :presence => {:message => "No puede estar en blanco"}

  validates :provider_id, :presence => {:message => "Debe seleccionar un proveedor"}

  private

  def set_total
    self.total = 0
    self.purchase_details.each do |d|
      self.total += d.price * d.quantity unless d.marked_for_destruction?
    end
  end
end
