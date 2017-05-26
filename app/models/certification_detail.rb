class CertificationDetail < ApplicationRecord
  audited
  belongs_to :certification
  belongs_to :employee
  delegate :name, :last_name, :identification_document, to: :employee, prefix: true

  validates :employee_id, :presence => {:message => "Seleccione un jornalero"}
  validates :quantity, :presence => {:message => "Ingrese cantidad"},
            :numericality => { :greater_than_or_equal_to => 0,
                               :less_than_or_equal_to => 365, message: "No puede ser negativo y debe ser menor o igual a 365"}

  validates :pay,  :presence => {:message => "Ingrese jornal"},
            :numericality => { :greater_than_or_equal_to => 0,
                               :less_than_or_equal_to => 9999999999, message: "No puede ser negativo y no puede ser mayor a 9.999.999.999"}

  validates :discount, :numericality => { :greater_than_or_equal_to => 0,
                                          :less_than_or_equal_to => 100, message: "No puede ser negativo y no puede ser mayor a 100%"}

  validates :observation, :length => {in: 0..200, :message => "Permite hasta 200 caracteres"}

end
