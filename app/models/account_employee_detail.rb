class AccountEmployeeDetail < ApplicationRecord
  belongs_to :account_employee
  belongs_to :employee
  belongs_to :certification
  delegate :name_with_initial, :identification_document, to: :employee, prefix: true

  validates :account_employee_id, presence:true
  validates :employee_id, presence:true
  validates :state, presence:true
  validates :total, presence:true
  validates :certification_id, presence:true
  validate :number_and_date

  def number_and_date
    if pay.to_i == 1 && number_bill.blank?
      errors.add(:number_bill, "Ingrese n° de recibo")
    elsif pay.to_i == 1 && date.blank?
      errors.add(:date, "Ingrese la fecha")
    end
  end

end
