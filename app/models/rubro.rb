class Rubro < ApplicationRecord
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

  def final_price
    self.price * (1 + (self.utility/100))
  end
end
