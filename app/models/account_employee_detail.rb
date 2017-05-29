class AccountEmployeeDetail < ApplicationRecord
  belongs_to :account_employee
  belongs_to :employee
  delegate :name_with_initial, :identification_document, to: :employee, prefix: true

end
