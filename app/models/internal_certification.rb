class InternalCertification < ApplicationRecord
  belongs_to :employee
  delegate :name, to: :employee, prefix: true
  belongs_to :contract
  delegate :name, to: :contract, prefix: true

  validates :contract_id, :presence => {:message => "Seleccione un contrato"}

  validates :employee_id, :presence => {:message => "Seleccione un jornalero"}

  validates :amount, :presence => {:message => "No puede estar en blanco"},
            :format => {:multiline => true, with: VALID_NUMBER_REGEX, :message => "Solo permite numeros"},
            :numericality => {inclusion: 1..2147483647, message: "Ingrese un número válido"}

  validates :date, :presence => {:message => "Seleccione una fecha"}

end
