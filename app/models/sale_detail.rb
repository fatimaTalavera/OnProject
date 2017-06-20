class SaleDetail < ApplicationRecord
  audited
  belongs_to :sale_bill, required: false
  belongs_to :client_certification, required: false

  #Validaciones
  #validates :quantity, :presence => {:message => "No puede estar vacio"},
  #          :numericality => { :greater_than_or_equal_to => 0, message: "No puede ser negativo"}
  #validates :price, :presence => {:message => "Debe rellenar este campo"},
  #          :numericality => { :greater_than_or_equal_to => 0, message: "No puede ser negativo"}
  validates :client_certification_id, :presence => {:message => "Seleccione una certificación"}
end
