class Employee < ApplicationRecord

  VALID_LETTER_REGEX = /\A([a-zA-Z]|[a-zA-Z][\. ])+\z/
  validates :name,  :presence => {:message => "No puede estar en blanco"},
            :length => { maximum:30, :message => "Permite hasta 30 caracteres"},
            format: { :with => VALID_LETTER_REGEX, message: 'Solo permite letras'}

  validates :last_name,  :presence => {:message => "No puede estar en blanco"},
            :length => { maximum:30, :message => "Permite hasta 30 caracteres"},
            format: { :with => VALID_LETTER_REGEX, message: 'Solo permite letras'}

  validates :identification_document, :presence => {:message => "No puede estar en blanco"},
            :numericality => {:only_integer => true, :message => "Debe ser un numero"},
            :uniqueness => {:message => "Ya existe el numero de documento"},
            :length => { maximum:10, :message => "Permite hasta 10 digitos"}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { :with => VALID_EMAIL_REGEX , message: "El formato es incorrecto. (Ej:example@example.com)" },
            :uniqueness => {:message => "El correo ya esta en uso, vuelva a intentarlo"},
            :allow_blank => true,
            :length => { maximum:30, :message => "Permite hasta 30 caracteres"}

  validates :address, :length  => { maximum:150, :message => "Permite hasta 150 caracteres"}

  validates :phone, :uniqueness => {:message => "El numero ya existe"}
end
