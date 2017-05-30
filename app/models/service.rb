class Service < ApplicationRecord
  audited
  has_many :rubro_service_details
  before_update :modify_subtotal_rubros

  VALID_PRICE_REGEX  = /\A^-?([0-9]|(\.[0-9]+))*$\z/

  validates :name,  :presence => {:message => "No puede estar en blanco"},
                    :length => { maximum:45, :message => "Permite hasta 45 caracteres"},
                    :uniqueness => {:message => "Este servicio ya existe, vuelva a intentarlo"}

  validates :description,   :presence => {:message => "No puede estar en blanco"},
                            :length => { maximum:200, :message => "Permite hasta 200 caracteres"}

  validates :measurement_unit,  :presence => {:message => "No puede estar en blanco"}

  validates :price, :presence => {:message => "No puede estar en blanco"},
                    :format => {:multiline => true, with: VALID_PRICE_REGEX , :message => "Solo permite numeros"},
                    :numericality => {:greater_than_or_equal_to => 0, :message => "No puede ser negativo"}

  def modify_subtotal_rubros
    if self.price_changed?
      @diferencia = self.price - self.price_was
      self.rubro_service_details.each do |detalle|
        detalle.update(subtotal: self.price * detalle.quantity)
      end
    end
  end
end
