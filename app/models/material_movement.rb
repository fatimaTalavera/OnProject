class MaterialMovement < ApplicationRecord
  has_many :movement_details
  accepts_nested_attributes_for :movement_details, allow_destroy: true
end
