class Budget < ApplicationRecord
  belongs_to :client
  belongs_to :contract
  has_many :budget_details

  accepts_nested_attributes_for :budget_details, allow_destroy: true

  after_save :as_total

  validates :client_id, :presence => {:message => "Debe seleccionar un cliente"}
  validates :state, :presence => {:message => "Debe seleccionar un estado"}
  validate :detalles_vacio

  def detalles_vacio
    if budget_details.empty?
      errors.add(:description, "Debe agregar al menos un rubro")
    end
  end

  def as_total
    total = 0
    self.budget_details.each do |detail|
      total = total + detail.subtotal
    end
    self.update_column(:total_amount, total)
  end
end