class Material < ApplicationRecord
  #valida que no quede en blanco
  validates :name, :presence => {:message => "No puede estar en blanco"},
            :length => {in: 3..30, :message => "Debe tener entre 3 y 30 caracteres"},
            #validar solo letras
            :format => {with: /[a-zA-ZÃ�ï¿½Ã�Â±Ã�Â¡Ã�Â©Ã�Â­Ã�Â³Ã�Âº]/, message: 'Solo permite letras'},
            #valida que no sea un nombre existente
            :uniqueness => {:message => "Este material ya existe, vuelva a intentarlo"}

  validates :description, :presence => {:message => "No puede estar en blanco"},
            :length => {in: 3..30, message: "Debe tener entre 3 y 30 caracteres"},
            :format => {with: /[a-zA-ZÃ�ï¿½Ã�Â±Ã�Â¡Ã�Â©Ã�Â­Ã�Â³Ã�Âº]/, message: 'Solo permite letras'}

  validates :quantity, :presence => {:message => "No puede estar en blanco"},
            # valida que solo sea numeros, y permita agregar double, o sea permita el punto
            :format => {:multiline => true, with: /^-?([0-9]|(\.[0-9]+))*$/, :message => "Solo permite numeros"},
            #valida que no sea negativo
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}


  validates :measurement_unit, :presence => {:message => "No puede estar en blanco"},
            :format => {with: /[a-zA-ZÃ�ï¿½Ã�Â±Ã�Â¡Ã�Â©Ã�Â­Ã�Â³Ã�Âº]/, message: 'No permite solo numeros'}

  validates :price, :presence => {:message => "No puede estar en blanco"},
            :format => {:multiline => true, with: /^-?([0-9]|(\.[0-9]+))*$/, :message => "Solo permite numeros"},
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

  validates :minimun_stock, :format => {:multiline => true, with: /^-?([0-9]|(\.[0-9]+))*$/, :message => "Solo permite numeros"},
            :numericality => {:greater_than_or_equal_to => 0, message: "No puede ser negativo"}

end
