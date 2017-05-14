class SaleBill < ApplicationRecord
  belongs_to :contract
  has_many :sale_details
  accepts_nested_attributes_for :sale_details, allow_destroy: true
  has_many :installments
  accepts_nested_attributes_for :installments, allow_destroy: true

  #Validaciones
  validates :condition, :presence => {:message => "Debe seleccionar una condicion de pago"}

  validates_numericality_of :number, :presence => {:message => "Debe rellenar este campo"},
                            :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 2147483647,
                            :message => "Ingrese un número válido"

  validates :date, :presence => {:message => "No puede estar en blanco"}

  validates :client_id, :presence => {:message => "Debe seleccionar un cliente"}
end
