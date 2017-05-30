class AccountEmployee < ApplicationRecord
  audited
  belongs_to :employee
  belongs_to :contract
  belongs_to :certification
  has_many :account_employee_details
  accepts_nested_attributes_for :account_employee_details, allow_destroy: true
  delegate :name, to: :contract, prefix: true
  delegate :name, :last_name, :identification_document, to: :employee, prefix: true
  after_update :discount_balance_employee

  enum states_type: [:Pendiente, :Pagado]

  validates :date, presence:true
  validates :contract_id, presence:true

  def discount_balance_employee
    details = account_employee_details.where(pay: 1).where(state: AccountEmployee.states_types.keys[0])
    details.each do |d|
      employee = Employee.find(d.employee_id)
      now_balance = employee.balance
      employee.update_attribute(:balance, now_balance - d.total)
      d.update_attribute(:state, AccountEmployee.states_types.keys[1])
    end

    account_completed = AccountEmployeeDetail.where(state: AccountEmployee.states_types.keys[1])
    list_certification = []
    account_completed.each do |a|
      list_certification << a.certification_id
    end

    list = list_certification.uniq
    list.each do |l|
      amount_detail_certification = CertificationDetail.where(certification_id: l).count
      amount_certification_completed = AccountEmployeeDetail.where(certification_id: l).where(state: AccountEmployee.states_types.keys[1]).count
      if(amount_detail_certification == amount_certification_completed)
        Certification.find(l).update_attribute(:state, AccountEmployee.states_types.keys[1])
      end
    end

  end
end
