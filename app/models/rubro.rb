class Rubro < ApplicationRecord
  audited
  belongs_to :material
  belongs_to :service
  has_many :rubro_material_details
  has_many :rubro_service_details
  accepts_nested_attributes_for :rubro_material_details, allow_destroy: true
  accepts_nested_attributes_for :rubro_service_details, allow_destroy: true

  validates :name, :presence => {:message => "Debe ingresar un nombre"}

  validates :measurement_unit, :presence => {:message => "Debe ingresar una unidad de medida"}

  validates :utility, :presence => {:message => "Debe rellenar este campo"}

  validate :is_empty_details

  def final_price
    self.price * (1 + (self.utility/100))
  end
#end

  def is_empty_details
    if rubro_material_details.empty?
      errors.add(:measurement_unit, "Debe agregar al menos un material")
    end

    if rubro_service_details.empty?
      errors.add(:measurement_unit, "Debe agregar al menos un servicio")
    end
  end

end
