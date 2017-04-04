class Budget < ApplicationRecord
  belongs_to :client
  has_many :budget_service_details
  has_many :budget_material_details

  accepts_nested_attributes_for :budget_service_details, allow_destroy: true
  accepts_nested_attributes_for :budget_material_details, allow_destroy: true

  after_save :as_total_service
  after_save :as_total_material
  after_save :as_total

  validates :client_id, :presence => {:message => "Debe seleccionar un cliente"}
  validates :state, :presence => {:message => "Debe seleccionar un estado"}

validate :detalles_vacio

  def detalles_vacio
    if budget_service_details.empty? and budget_material_details.empty?
      errors.add(:state, "Debe agregar al menos un servicio o material")
    end
    end

  def as_total_service
    total_service = 0
    self.budget_service_details.each do |service_detail|
      total_service = total_service + service_detail.subtotal
    end
    self.update_column(:total_service, total_service)
  end

  def as_total_material
    total_material = 0
    self.budget_material_details.each do |material_detail|
      total_material = total_material + material_detail.subtotal
    end
    self.update_column(:total_material, total_material)
  end

  def as_total
    self.update_column(:total_amount, total_service + total_material)
  end
end
