class Rubro < ApplicationRecord
  belongs_to :material
  belongs_to :service
  has_many :rubro_material_details
  has_many :rubro_service_details
  accepts_nested_attributes_for :rubro_material_details, allow_destroy: true
  accepts_nested_attributes_for :rubro_service_details, allow_destroy: true

  validates :name, :presence => {:message => "Debe ingresar un nombre"}

  validates :utility, :presence => {:message => "Debe ingresar la utilidad"}

  def final_price
    self.price * (1 + (self.utility/100))
  end
end
