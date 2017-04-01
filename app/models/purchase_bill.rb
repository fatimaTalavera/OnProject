class PurchaseBill < ApplicationRecord
  belongs_to :provider
  delegate :name, :ruc, to: :provider, prefix: true

  has_many :purchase_details
  accepts_nested_attributes_for :purchase_details, allow_destroy: true

  validates :condition, :presence => {:message => "Debe seleccionar una condicion de pago"}

  validates :number, :presence => {:message => "No puede estar en blanco"},
            #valida que no sea negativo
            :numericality => {inclusion: 1..2147483647, message: "Ingrese un número válido"}

  validates :date, :presence => {:message => "No puede estar en blanco"}

  validates :provider, :presence => {:message => "Debe seleccionar un proveedor"}

end