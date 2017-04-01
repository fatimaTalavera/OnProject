class BudgetServiceDetail < ApplicationRecord
  belongs_to :budget
  belongs_to :service

  after_create :ac_subtotal

def ac_subtotal

  service = Service.find(self.service_id)
  subtotal = service.price * service_quantity

  self.subtotal = subtotal
end


end
