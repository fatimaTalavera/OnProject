class Client < ApplicationRecord
  has_many :contracts
  def full_name
    "#{name} #{last_name}"
  end

  validates :name,  :presence => {:message => "No puede estar en blanco"},
                    :length => { in: 4..30 , message: "Debe tener entre 4 y 30 caracteres"},
                    :format => {with: /[a-zA-ZÃ�ï¿½Ã�Â±Ã�Â¡Ã�Â©Ã�Â­Ã�Â³Ã�Âº]/, message: 'Solo permite letras'}

  validates :identification_document, :presence => {:message => "No puede estar en blanco"},
                                      :length => { in: 6..10 , message: "Debe tener entre 7 y 10 caracteres"},
                                      :numericality => {:only_integer => true, :message => "Debe ser un numero"},
                                      :uniqueness => {:message => "Ya existe el numero de documento"}

  validates :last_name, :format => {with: /[a-zA-ZÃ�ï¿½Ã�Â±Ã�Â¡Ã�Â©Ã�Â­Ã�Â³Ã�Âº]/, message: 'Solo permite letras'},
                        :allow_blank => true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { :with => VALID_EMAIL_REGEX , message: "El formato del correo es invalido" },
                    :uniqueness => {:message => "El correo ya esta en uso, vuelva a intentarlo"},
                    :allow_blank => true

  VALID_PHONE_REGEX = /\d{4}-\d{3}-\d{3}/
  validates :phone, format: { :with => VALID_PHONE_REGEX , message: "El formato debe ser 0000-000-000" },
                    :allow_blank => true

end