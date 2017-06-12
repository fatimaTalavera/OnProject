class Contract < ApplicationRecord
  extend Enumerize
  audited
  belongs_to :client
  has_many :material_movements
  has_many :client_certifications
  has_one :budget
  has_many :budget_details, through: :budget
  has_many :sale_bills
  has_many :certifications
  has_many :account_employees

  enumerize :state, in: [:activo, :terminado], predicates: true

  delegate :name, :description, :total_amount, :client_name, :client_ruc, to: :budget, prefix: true

  validates :start_date, :presence => {:message => "No puede estar en blanco"}

  validates :end_date, :presence => {:message => "No puede estar en blanco"}
  validates :amount, :presence =>true
  validates :client_id, :presence =>true
  validates :name, :presence =>true, :uniqueness =>true
  validate :valid_amount_num

  def self.new_by_budget(params, budget)
    contract = self.new(params)
    contract.client = budget.client
    contract.amount = budget.total_amount
    contract.name = budget.name
    contract
  end

  def valid_amount_num
    if amount.nil? == true
      errors.add(:amount, "No puede estar vacío")
    end
    if (amount.nil? == false) and amount <= 0
      errors.add(:amount, "Debe ser mayor a 0")
    end
  end

end
