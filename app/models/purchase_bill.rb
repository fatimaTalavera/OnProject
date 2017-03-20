class PurchaseBill < ApplicationRecord
  has_many :purchase_details
  accepts_nested_attributes_for :purchase_details, allow_destroy: true

  validates :condition, :presence => {:message => "Debe seleccionar una condicion de pago"}

  validates :number, :presence => {:message => "No puede estar en blanco"},
            #valida que no sea negativo
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  validates :date, :presence => {:message => "No puede estar en blanco"}

end