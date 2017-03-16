class MaterialMovement < ApplicationRecord
  belongs_to :contract
  has_many :movement_details
  accepts_nested_attributes_for :movement_details, allow_destroy: true
  before_create :crear_fecha

  def crear_fecha
    self.fecha = Time.zone.now
  end

  validates :contract_id, :presence => {:message => "Debe seleccionar un contrato"}

end
