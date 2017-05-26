class Contract < ApplicationRecord
  audited
  belongs_to :client
  has_many :material_movements
  has_many :client_certifications
  has_one :budget
  has_many :budget_details, through: :budget
  has_many :sale_bills
  has_many :certifications
  has_many :account_employees

  delegate :name, :ruc, to: :client, prefix: true

  validates :client_id, :presence => {:message => "Debe seleccionar un cliente"}

  validates :name, :presence => {:message => "No puede estar en blanco"},
            :length => {maximum:150, :message => "Permite hasta 150 caracteres"}

  validates :amount, :presence => {:message => "No puede estar en blanco"},
            #valida que no sea negativo
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  validates :start_date, :presence => {:message => "No puede estar en blanco"}

  validates :end_date, :presence => {:message => "No puede estar en blanco"}

end
