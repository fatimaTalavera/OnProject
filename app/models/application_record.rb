class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  #valida solo numeros
  VALID_LETTER_REGEX = /\A([a-zA-ZñÑáéíóúÁÉÍÓÚ\s]|[a-zA-ZñÑáéíóúÁÉÍÓÚ\s][\. ])+\z/
  #cadena de letras con numeros
  VALID_LETTER_NUMBER_REGEX = /\A^(?:[A-Za-zñÑáéíóúÁÉÍÓÚ\s]+)(?:[A-Za-z0-9 _ñÑáéíóúÁÉÍÓÚ\s]*)$\z/
  # valida que solo sea numeros, y permita agregar double, o sea permita el punto
  VALID_NUMBER_REGEX = /\A^-?([0-9]|(\.[0-9]+))*$\z/
  # valida formato de ruc 88888-8
  VALID_RUC_REGEX = /\A\d{4,9}[-]?\d{1}\z/
  # valida formato de correo electronico
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # valida formato de timbrado, numero de 8 digitos
  VALID_LETTER_HEAD_REGEX = /\d{8}/

end
