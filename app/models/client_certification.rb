class ClientCertification < ApplicationRecord
  audited
  belongs_to :contract
  belongs_to :budget
  has_many :budget_details, through: :contract
  has_many :client_certification_details, dependent: :destroy
  has_one :sale_detail

  enum state: { pending: 0, paid: 1 }
  enum state_type: { Pendiente: 0, Pagado: 1 }

  delegate :name, to: :contract, prefix: true

  accepts_nested_attributes_for :client_certification_details, :allow_destroy => true

  before_create :subtract_missing_amount

  validates :date, :presence => {:message => "No puede estar en blanco"}

  validates :received, 	:presence => {:message => "No puede estar en blanco"},
  						          :length => { maximum: 50, :message => "Permite hasta 50 caracteres"},
                        format: { :with => VALID_LETTER_REGEX, message: 'Solo permite letras'}

  validates :observation, :length => { maximum: 200, :message => "Permite hasta 200 caracteres"}

  validate :detalles_vacio

  def detalles_vacio
    if client_certification_details.empty?
      errors.add(:observation, "Debe agregar al menos un rubro")
    end
  end

  def subtract_missing_amount
    total = 0
    self.client_certification_details.each do |detail|
      total += detail.total
      budget = BudgetDetail.find(detail.budget_detail_id)
      certified = budget.certified_quantity + detail.quantity
      if budget.quantity == certified
        BudgetDetail.update(budget.id, certified_quantity: certified, state: BudgetDetail.states[:certified])
      else
        BudgetDetail.update(budget.id, certified_quantity: certified)
      end
    end
    self.total = total
  end
end
