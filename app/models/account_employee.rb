class AccountEmployee < ApplicationRecord
  audited
  belongs_to :employee
  belongs_to :certification

  delegate :name, to: :contract, prefix: true
  delegate :name, :last_name, :identification_document, to: :employee, prefix: true

  validates :certification_id, :presence => {:message => "Debe seleccionar una certificacion"}
  validates :employee_id, :presence => {:message => "Debe seleccionar un empleado"}
  validates :date, :presence => {:message => "Debe seleccionar una fecha"}
  validates :number_bill, :presence => {:message => "Debe ingresar el número de factura/recibo"}
  validates :pay, :presence => {:message => "Debe ingresar el monto a pagar"}
end
