class ClientCertification < ApplicationRecord
  belongs_to :contract
  has_many :client_certification_details, dependent: :destroy

  delegate :name, to: :contract, prefix: true

  accepts_nested_attributes_for :client_certification_details, :allow_destroy => true

  VALID_LETTER_REGEX = /\A([a-zA-Z]|[a-zA-Z][\. ])+\z/

  validates :contract_id,  :presence => {:message => "Debe seleccionar una obra"}

  validates :state, :presence => {:message => "No puede estar en blanco"}

  validates :date, :presence => {:message => "No puede estar en blanco"}

  validates :received, 	:presence => {:message => "No puede estar en blanco"},
  						          :length => { maximum: 50, :message => "Permite hasta 50 caracteres"},
                        format: { :with => VALID_LETTER_REGEX, message: 'Solo permite letras'}

  validates :observation, :length => { maximum: 200, :message => "Permite hasta 200 caracteres"}

end
