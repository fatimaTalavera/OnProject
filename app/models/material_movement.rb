class MaterialMovement < ApplicationRecord
  belongs_to :contract
  delegate :name, to: :contract, prefix: true
  has_many :movement_details
  accepts_nested_attributes_for :movement_details, allow_destroy: true

  validates :contract_id, :presence => {:message => "Debe seleccionar un contrato"}

  validates :date, :presence => {:message => "Seleccione la fecha"}

end
