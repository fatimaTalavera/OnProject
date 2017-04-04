class BudgetServiceDetail < ApplicationRecord
  belongs_to :budget
  belongs_to :service

  after_create :ac_subtotal

  validates :service_id, :presence => {:message => "Seleccione servicio"}
  validates :service_quantity, :presence => {:message => "No puede estar en blanco"}

  def ac_subtotal
    service = Service.find(self.service_id)
    subtotal = service.price * service_quantity
    self.update_attributes(subtotal: subtotal)
  end

end
