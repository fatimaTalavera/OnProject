class CertificationDetail < ApplicationRecord
  belongs_to :certification
  belongs_to :employee

  #valida solo numeros
  VALID_LETTER_REGEX = /\A([a-zA-Z]|[a-zA-Z][\. ])+\z/
  #cadena de letras con numeros
  VALID_LETTER_NUMBER_REGEX = /\A^(?:[A-Za-z]+)(?:[A-Za-z0-9 _]*)$\z/

  validates :employee_id, :presence => {:message => "Seleccione un jornalero"}
  validates :quantity, :presence => {:message => "Ingrese cantidad"}, :numericality => { :greater_than_or_equal_to => 0, message: "No puede ser negativo"}
  validates :pay,  :presence => {:message => "Ingrese jornal"}, :numericality => { :greater_than_or_equal_to => 0, message: "No puede ser negativo" }
  validates :discount, :numericality => { :greater_than_or_equal_to => 0, message: "No puede ser negativo" }
  validates :observation, :length => {in: 0..200, :message => "Permite hasta 30 caracteres"}

end
