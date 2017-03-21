class Client < ApplicationRecord
  has_many :contracts
  def full_name
    "#{name} #{last_name}"
  end

  VALID_LETTER_REGEX = /\A([a-zA-Z]|[a-zA-Z][\. ])+\z/
  VALID_RUC_REGEX = /\A\d{5,9}[-]?\d{1}\z/

  validates :name,  :presence => {:message => "No puede estar en blanco"},
                    :length => { maximum:30, :message => "Permite hasta 30 caracteres"},
                    format: { :with => VALID_LETTER_REGEX, message: 'Solo permite letras'}

  validates :ruc, :presence => {:message => "No puede estar en blanco"},
                  :format => {:multiline => true, with: VALID_RUC_REGEX, :message => "Formato de RUC/CI incorrecto"},
                  :uniqueness => {:message => "Ya existe este RUC"}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { :with => VALID_EMAIL_REGEX , message: "El formato del correo es invalido" },
                    :uniqueness => {:message => "El correo ya esta en uso, vuelva a intentarlo"},
                    :allow_blank => true

end