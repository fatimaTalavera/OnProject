class SaleBill < ApplicationRecord
  extend Enumerize
  audited

  belongs_to :contract
  has_many :sale_details
  has_many :installments
  has_many :client_certifications, through: :contract

  delegate :name, :budget_client_name, :advance_payment_percentage, to: :contract, prefix: true

  accepts_nested_attributes_for :sale_details, allow_destroy: true
  accepts_nested_attributes_for :installments, allow_destroy: true

  enumerize :condition, in: [:contado, :crédito], predicates: true
  enumerize :state, in: [:pendiente, :pagado], predicates: true

  after_validation :set_balance, if: :crédito?
  after_validation :set_state

  after_create :change_certifications

  #Validaciones
  #validates :condition, :presence => {:message => "Debe seleccionar una condicion de pago"}

  validates :number, :presence => {:message => "Debe rellenar este campo"}

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

  def change_certifications
    self.sale_details.each do |detail|
      ClientCertification.update(detail.client_certification_id, state: ClientCertification.states[:paid])
    end
  end
end
