class InternalCertification < ApplicationRecord
  belongs_to :employee
  belongs_to :contract

  validates :contract_id, :presence => {:message => "Seleccione un contrato"}

  validates :employee_id, :presence => {:message => "Seleccione un jornalero"}

  validates :amount, :presence => {:message => "No puede estar en blanco"},
            :format => {:multiline => true, with: VALID_NUMBER_REGEX, :message => "Solo permite numeros"},
            #valida que no sea negativo
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  validates :date, :presence => {:message => "Seleccione una fecha"}


end
