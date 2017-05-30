class PurchaseBill < ApplicationRecord
  extend Enumerize
  audited
  belongs_to :provider
  delegate :name, :ruc, to: :provider, prefix: true

  has_many :purchase_details
  has_many :payments
  has_many :installment_purchases
  accepts_nested_attributes_for :installment_purchases

  enumerize :condition, in: [:contado, :crédito], predicates: true
  enumerize :state, in: [:pendiente, :pagado], predicates: true

  #after_validation :set_total
  after_validation :set_balance, if: :crédito?
  after_validation :set_state
  after_save :set_payment, if: :contado?

  accepts_nested_attributes_for :purchase_details, allow_destroy: true

  validates :condition, :presence => {:message => "Debe seleccionar una condicion de pago"}

  validates_numericality_of :number, :presence => {:message => "Debe rellenar este campo"},
                            :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 2147483647,
                            :message => "Ingrese un número válido"

  validates :date, :presence => {:message => "No puede estar en blanco"}

  validates :provider_id, :presence => {:message => "Debe seleccionar un proveedor"}

  private

  #def set_total
  #  self.total = 0
  #  self.purchase_details.each do |d|
  #    self.total += d.price * d.quantity unless d.marked_for_destruction?
  #  end
  #end

  def set_state
    if self.balance == 0
      self.state = :pagado
    else
      self.state = :pendiente
    end
  end

  def set_balance
    self.balance = self.total
  end

  def set_payment
    payment = Payment.new
    payment.date = Time.zone.now
    payment.amount = self.total
    payment.balance = 0
    payment.purchase_bill_id = self.id
    payment.save()
  end

end
