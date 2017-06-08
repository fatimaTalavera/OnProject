class Budget < ApplicationRecord
  audited
  enum state: { pending: 0, studying: 1, approved: 2, cancelled: 3, rejected: 4 }
  enum state_type: { Pendiente: 0, Estudiando: 1, Aprobado: 2, Anulado: 3, Rechazado: 4 }

  belongs_to :client
  belongs_to :contract
  has_many :budget_details

  delegate :name, :ruc, to: :client, prefix: true
  delegate :name, to: :rubro, prefix: true

  accepts_nested_attributes_for :budget_details, allow_destroy: true

  after_save :as_total

  validates :name, :presence => {:message => "No puede estar en blanco"},
            :length => {maximum:150, :message => "Permite hasta 150 caracteres"},
            format: { :with => VALID_LETTER_REGEX, message: 'Solo permite letras'},
            :uniqueness => {:message => "Este nombre ya existe, vuelva a intentarlo"}
  validates :client_id, :presence => {:message => "Debe seleccionar un cliente"}
  validate :detalles_vacio

  def detalles_vacio
    if budget_details.empty?
      errors.add(:description, "Debe agregar al menos un rubro")
    end
  end

  def as_total
    total = 0
    self.budget_details.each do |detail|
      total = total + detail.subtotal
    end
    self.update_column(:total_amount, total)
  end

  def self.clients
    Client.all
  end

end