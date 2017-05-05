class Certification < ApplicationRecord
  audited
  belongs_to :contract
  has_many :certification_details
  enum states_type: [:pendiente, :aprobado, :rechazado]
  delegate :name, to: :contract, prefix: true
  accepts_nested_attributes_for :certification_details, allow_destroy: true
  after_commit :update_balance

  validates :contract_id, :presence => {:message => "Seleccione una obra"}
  validates :date, :presence => {:message => "Seleccione una fecha"}
  validates :state, :presence => {:message => "Seleccione un estado"}
  validate :is_empty_detail

  def is_empty_detail
    if certification_details.empty?
      errors.add(:certification_details, "Debe agregar al menos un detalle")
    end
  end


  def update_balance
    aproved_certification = Certification.find(id)
    if(aproved_certification.state == "aprobado")
      certification_details.each do |detail|
        before_balance = Employee.find(detail.employee_id).balance
        Employee.find(detail.employee_id).update_attribute(:balance, before_balance+detail.total)
      end
      aproved_certification.update_attribute(:state,"terminado")
    end
  end


end