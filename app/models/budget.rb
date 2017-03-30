class Budget < ApplicationRecord
  belongs_to :client
  has_many :budget_service_details
  has_many :budget_material_details

  accepts_nested_attributes_for :budget_service_details, allow_destroy: true
  accepts_nested_attributes_for :budget_material_details, allow_destroy: true

end
