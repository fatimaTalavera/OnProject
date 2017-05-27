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

  validates_numericality_of :utility, :presence => {:message => "Debe rellenar este campo"},
                            :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 9999,
                            :message => "Ingrese un número positivo menor a 9999"
  validate :is_empty_details

#  def final_price
#   self.price * (1 + (self.utility/100))
# end
#end

  def is_empty_details
    if rubro_material_details.empty?
      errors.add(:measurement_unit, "Debe agregar al menos un material")
    end

    if rubro_service_details.empty?
      errors.add(:measurement_unit, "Debe agregar al menos un servicio")
    end
  end
  def final_price
    total_material = 0
    total_service = 0
    self.rubro_material_details.each do |material_detail|
      total_material = total_material + material_detail.subtotal
    end
    self.rubro_service_details.each do |service_detail|
      total_service = total_service + service_detail.subtotal
    end
    (total_material + total_service) * (1 + (self.utility/100))

  end

end
