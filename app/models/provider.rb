class Provider < ApplicationRecord

  VALID_LETTER_REGEX = /\A([a-zA-Z]|[a-zA-Z][\. ])+\z/
  VALID_NUMBER_REGEX = /\A^-?([0-9]|(\-[0-9]))*$\z/
  VALID_RUC_REGEX = /\A\d{5,9}[-]?\d{1}\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]{1,4}\z/i
  #cadena de letras con numeros
  VALID_LETTER_NUMBER_REGEX = /\A^(?:[A-Za-z]+)(?:[A-Za-z0-9 _]*)$\z/

  validates :name,  :presence => {:message => "No puede estar en blanco"},
            :length => { maximum:30, :message => "Permite hasta 30 caracteres"},
            format: { :with => VALID_LETTER_REGEX, message: "Solo permite letras"}

  validates :ruc, :presence => {:message => "No puede estar en blanco"},
            :format => {:multiline => true, with: VALID_RUC_REGEX, message: "Formato de RUC/CI incorrecto (Ej: 99999-9 o 99999)"},
            :uniqueness => {:message => "Ya existe este RUC"}

  validates :email, format: { :with => VALID_EMAIL_REGEX , message: "El formato debe ser example@example.com" },
            :uniqueness => {:message => "El correo ya esta en uso, vuelva a intentarlo"},
            :allow_blank => true

  validates :phone, :uniqueness => {:message => "El numero ya existe"}, :allow_blank => true
end
