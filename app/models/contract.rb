class Contract < ApplicationRecord
  belongs_to :client
  has_many :material_movements

  validates :client,  :presence => {:message => "Debe seleccionar un cliente"}

  validates :name, :presence => {:message => "No puede estar en blanco"},
            :length => {maximum:45, :message => "Permite hasta 45 caracteres"},
            #valida que no sea un nombre existente
            :uniqueness => {:message => "Este contrato ya existe, vuelva a intentarlo"}

  validates :amount, :presence => {:message => "No puede estar en blanco"},
            #valida que no sea negativo
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  validates :start_date, :presence => {:message => "No puede estar en blanco"}

  validates :end_date, :presence => {:message => "No puede estar en blanco"}

  validate :end_date_not_less_than_start

  def end_date_not_less_than_start
    errors.add(:end_date, "La fecha de cierre no debe ser menor que el inicio") if :start_date > :end_date
  end




end
