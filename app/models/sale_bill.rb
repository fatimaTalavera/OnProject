class SaleBill < ApplicationRecord
  extend Enumerize
  audited
  belongs_to :contract
  delegate :name, to: :contract, prefix: true
  has_many :sale_details
  accepts_nested_attributes_for :sale_details, allow_destroy: true
  has_many :installments
  accepts_nested_attributes_for :installments, allow_destroy: true

  enumerize :condition, in: [:contado, :crédito], predicates: true
  enumerize :state, in: [:pendiente, :pagado], predicates: true

  after_validation :set_balance, if: :crédito?
  after_validation :set_state
  #Validaciones
  validates :condition, :presence => {:message => "Debe seleccionar una condicion de pago"}

  validates_numericality_of :number, :presence => {:message => "Debe rellenar este campo"},
                            :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 2147483647,
                            :message => "Ingrese un número válido"

  validates :date, :presence => {:message => "No puede estar en blanco"}

  validates :contract_id, :presence => {:message => "Debe seleccionar un contrato"}

  private
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
end
