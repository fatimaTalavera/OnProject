class BudgetServiceDetail < ApplicationRecord
  belongs_to :budget
  belongs_to :service

  after_create :ac_subtotal

def ac_subtotal
  subtotal_ = 0
  service = Service.find(service_id)

  subtotal = subtotal_ + (service.price * service_price)
end

end
