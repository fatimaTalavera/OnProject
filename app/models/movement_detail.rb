class MovementDetail < ApplicationRecord
  belongs_to :material_movement, required: false
  belongs_to :material
end
