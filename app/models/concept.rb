class Concept < ApplicationRecord
  VALID_LETTER_REGEX = /\A([a-zA-Z]|[a-zA-Z][\. ])+\z/

  validates :name,  :presence => {:message => "No puede estar en blanco"},
            :length => { minimum: 4, maximum:50, :message => "Permite de 4 hasta 50 caracteres"},
            format: { :with => VALID_LETTER_REGEX, message: 'Solo permite letras'}
end
