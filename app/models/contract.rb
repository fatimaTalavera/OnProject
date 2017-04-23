class Contract < ApplicationRecord
  audited
  belongs_to :client, required: true
  has_many :material_movements
  has_many :client_certifications
  delegate :name, :ruc, to: :client, prefix: true

  validates :client,  :presence => {:message => "Debe seleccionar un cliente"}

  validates :name, :presence => {:message => "No puede estar en blanco"},
            :length => {maximum:50, :message => "Permite hasta 50 caracteres"},
            #valida que no sea un nombre existente
            :uniqueness => {:message => "Este contrato ya existe, vuelva a intentarlo"}

  validates :amount, :presence => {:message => "No puede estar en blanco"},
            #valida que no sea negativo
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  validates :start_date, :presence => {:message => "No puede estar en blanco"}

  validates :end_date, :presence => {:message => "No puede estar en blanco"}

end
