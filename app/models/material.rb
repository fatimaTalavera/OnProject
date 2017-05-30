class Material < ApplicationRecord
  audited
  has_many :rubro_material_details
  before_update :modify_subtotal_rubros

  validates :name, :presence => {:message => "No puede estar en blanco"},
            :length => {in: 3..30, :message => "Debe tener entre 3 y 30 caracteres"},
            #valida que no sea un nombre existente
            :uniqueness => {:message => "Este material ya existe, vuelva a intentarlo"}

  validates :description, :length => {maximum: 30, message: "Debe tener entre 3 y 30 caracteres"},
            :allow_blank => true;

  validates :quantity, :presence => {:message => "No puede estar en blanco"},
            :format => {:multiline => true, with: VALID_NUMBER_REGEX, :message => "Solo permite numeros"},
            #valida que no sea negativo
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  validates :measurement_unit, :presence => {:message => "No puede estar en blanco"},
            :format => {with: VALID_LETTER_NUMBER_REGEX, message: "No permite solo numeros"}

  validates :price, :presence => {:message => "No puede estar en blanco"},
            :format => {:multiline => true, with: VALID_NUMBER_REGEX, :message => "Solo permite numeros"},
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  validates :minimun_stock, :presence => {:message => "No puede estar en blanco"},
            :format => {:multiline => true, with: VALID_NUMBER_REGEX, :message => "Solo permite numeros"},
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  def modify_subtotal_rubros
    if self.price_changed?
      @diferencia = self.price - self.price_was
      self.rubro_material_details.each do |detalle|
        detalle.update(subtotal: self.price * detalle.quantity)
      end
    end
  end
end
