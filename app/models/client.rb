class Client < ApplicationRecord
  has_many :contracts
  def full_name
    "#{name} #{last_name}"
  end

  validates :name,  :presence => {:message => "No puede estar en blanco"},
                    :length => { in: 4..50 , message: "Debe tener entre 4 y 50 caracteres"},
                    :format => {with: /[a-zA-ZÃ�ï¿½Ã�Â±Ã�Â¡Ã�Â©Ã�Â­Ã�Â³Ã�Âº]/, message: 'Solo permite letras'}

  validates :identification_document, :presence => {:message => "No puede estar en blanco"},
                                      :length => { in: 6..10 , message: "Debe tener entre 7 y 10 caracteres"},
                                      :numericality => {:only_integer => true, :message => "Debe ser un numero"},
                                      :uniqueness => {:message => "Ya existe el numero de documento"}
  validates :email, :email_format => true,
                    :uniqueness => {:message => "El correo ya esta en uso, vuelva a intentarlo"}

end
