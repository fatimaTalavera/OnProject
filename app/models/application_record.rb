class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  #valida solo numeros
  VALID_LETTER_REGEX = /\A([a-zA-Z]|[a-zA-Z][\. ])+\z/
  #cadena de letras con numeros
  VALID_LETTER_NUMBER_REGEX = /\A^(?:[A-Za-z]+)(?:[A-Za-z0-9 _]*)$\z/
  # valida que solo sea numeros, y permita agregar double, o sea permita el punto
  VALID_NUMBER_REGEX = /\A^-?([0-9]|(\.[0-9]+))*$\z/
end
