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

end
