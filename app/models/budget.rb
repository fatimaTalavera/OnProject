class Budget < ApplicationRecord
  belongs_to :client
  has_many :budget_service_details
  has_many :budget_material_details

  accepts_nested_attributes_for :budget_service_details, allow_destroy: true
  accepts_nested_attributes_for :budget_material_details, allow_destroy: true

  after_create :ac_total_amount

  def ac_total_amount
    total_amount = 0
    self.budget_service_details.each do |service_detail|
      service = Service.find(service_detail.service_id)
      total_amount = total_amount + (service.price * service_detail.service_quantity)
    end
      self.total_amount = total_amount
  end
end
