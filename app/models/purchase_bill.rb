class PurchaseBill < ApplicationRecord
  has_many :purchase_details
  accepts_nested_attributes_for :purchase_details, allow_destroy: true
  before_create :crear_fecha

  def crear_fecha
    self.date = Time.zone.now
  end

  validates :condition, :presence => {:message => "Debe seleccionar una condicion de pago"}

  validates :number, :presence => {:message => "No puede estar en blanco"},
            # valida que solo sea numeros, y permita agregar double, o sea permita el punto
            :format => {:multiline => true, with: /^-?([0-9]|(\.[0-9]+))*$/, :message => "Solo permite numeros"},
            #valida que no sea negativo
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

end