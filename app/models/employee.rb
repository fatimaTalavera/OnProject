class Employee < ApplicationRecord
  audited
  has_many :certifications
  VALID_LETTER_REGEX = /\A([a-zA-Z]|[a-zA-Z][\. ])+\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]{1,4}\z/i

  validates :name,  :presence => {:message => "No puede estar en blanco"},
            :length => { maximum:30, :message => "Permite hasta 30 caracteres"},
            format: { :with => VALID_LETTER_REGEX, message: 'Solo permite letras'}

  validates :last_name,  :presence => {:message => "No puede estar en blanco"},
            :length => { maximum:30, :message => "Permite hasta 30 caracteres"},
            format: { :with => VALID_LETTER_REGEX, message: 'Solo permite letras'}

  validates :identification_document, :presence => {:message => "No puede estar en blanco"},
            :uniqueness => {:message => "Ya existe el numero de documento"}

  validates :email, format: { :with => VALID_EMAIL_REGEX , message: "El formato debe ser example@example.com" },
            :uniqueness => {:message => "El correo ya esta en uso, vuelva a intentarlo"},
            :allow_blank => true

  validates :phone, :uniqueness => {:message => "El numero ya existe"}, :allow_blank => true
  before_validation :rem_guion_to_ci

  def rem_guion_to_ci
    self.identification_document = identification_document.to_s.gsub(/\D/, '')
  end

  def name_with_initial
    "#{name} #{last_name}"
  end
end
