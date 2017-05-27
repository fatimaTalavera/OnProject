class AccountEmployeeDetail < ApplicationRecord
  belongs_to :account_employee
  belongs_to :employee

end
