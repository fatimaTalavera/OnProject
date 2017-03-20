class Provider < ApplicationRecord

  VALID_LETTER_REGEX = /\A([a-zA-Z]|[a-zA-Z][\. ])+\z/
  VALID_NUMBER_REGEX = /\A^-?([0-9]|(\-[0-9]))*$\z/

  #cadena de letras con numeros
  VALID_LETTER_NUMBER_REGEX = /\A^(?:[A-Za-z]+)(?:[A-Za-z0-9 _]*)$\z/

  validates :name,  :presence => {:message => "No puede estar en blanco"},
            :length => { maximum:30, :message => "Permite hasta 30 caracteres"},
            format: { :with => VALID_LETTER_REGEX, message: "Solo permite letras"}

  validates :ruc, :presence => {:message => "No puede estar en blanco"},
            :format => {:multiline => true, with: VALID_NUMBER_REGEX, :message => "Solo permite numeros"},
            :uniqueness => {:message => "Ya existe este RUC"}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { :with => VALID_EMAIL_REGEX , message: "El formato del correo es invalido" },
            :uniqueness => {:message => "El correo ya esta en uso, vuelva a intentarlo"},
            :allow_blank => true

end
