class Contract < ApplicationRecord
  belongs_to :client
  has_many :material_movements
end
