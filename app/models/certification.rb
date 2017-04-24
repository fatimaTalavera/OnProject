class Certification < ApplicationRecord
  belongs_to :contract
  has_many :certification_details
  enum states_type: [:pendiente, :aprobado, :terminado, :rechazado]
  delegate :name, to: :contract, prefix: true
  accepts_nested_attributes_for :certification_details, allow_destroy: true


  validates :contract_id, :presence => {:message => "Seleccione una obra"}
  validates :date, :presence => {:message => "Seleccione una fecha"}
  validates :state, :presence => {:message => "Seleccione un estado"}
  validate :is_detail


  def is_detail
    if certification_details.empty?
      errors.add(:contract_id, "Debe agregar al menos un jornalero")
    end
  end

end