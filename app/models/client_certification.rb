class ClientCertification < ApplicationRecord
  audited
  belongs_to :contract
  belongs_to :budget
  has_many :budget_details, through: :contract
  has_many :client_certification_details, dependent: :destroy

  delegate :name, to: :contract, prefix: true

  accepts_nested_attributes_for :client_certification_details, :allow_destroy => true

  after_create :subtract_missing_amount

  validates :contract_id,  :presence => {:message => "Debe seleccionar una obra"}

  validates :date, :presence => {:message => "No puede estar en blanco"}

  validates :received, 	:presence => {:message => "No puede estar en blanco"},
  						          :length => { maximum: 50, :message => "Permite hasta 50 caracteres"},
                        format: { :with => VALID_LETTER_REGEX, message: 'Solo permite letras'}

  validates :observation, :length => { maximum: 200, :message => "Permite hasta 200 caracteres"}

  def subtract_missing_amount
    self.client_certification_details.each do |detail|
      budget = BudgetDetail.find(detail.budget_detail_id)
      diferencia = budget.certified_quantity - detail.quantity
      if 0 == diferencia
        BudgetDetail.update(budget, :certified_quantity => diferencia, :state => BudgetDetail.states[:certified])
      else
        BudgetDetail.update(budget, :certified_quantity => diferencia)
      end
    end
  end
end
