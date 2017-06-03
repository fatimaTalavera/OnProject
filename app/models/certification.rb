class Certification < ApplicationRecord
  audited
  belongs_to :contract
  has_many :certification_details

  enum state: { pending: 0, rejected: 1, approved: 2, paid: 3 }
  delegate :name, to: :contract, prefix: true
  accepts_nested_attributes_for :certification_details, allow_destroy: true
  after_commit :update_balance

  scope :pay_current, -> { CompanyConfig.all.pluck(:current_pay).first }

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
    if(aproved_certification.approved?)
      account = AccountEmployee.where(contract_id: aproved_certification.contract_id)
      puts("cuenta")
      puts(account)
      puts(account.blank?)

      if(account.blank?)
        puts("entro en bucle1")
        #crea movimiento en cta. cte. empleado
        AccountEmployee.transaction do
          begin
            new_account = AccountEmployee.new(contract_id: aproved_certification.contract_id, date: Time.now)
            if new_account.save
              certification_details.each do |d|
                new_account_detail = AccountEmployeeDetail.new(account_employee_id: new_account.id, certification_id: aproved_certification.id, employee_id: d.employee_id, total: d.total, state: "Pendiente")
                if new_account_detail.save
                  #actualiza saldo empleado
                  before_balance = Employee.find(d.employee_id).balance
                  Employee.find(d.employee_id).update_attribute(:balance, before_balance + d.total)
                end
              end
            end
            true
          rescue => e
            false
          end
        end
      else
        puts("bucle2")
        puts(certification_details)
        certification_details.each do |d|
          puts("for certificaacion")
          puts(d)
          new_account_detail = AccountEmployeeDetail.new(account_employee_id: account.pluck(:id).first, certification_id: aproved_certification.id, employee_id: d.employee_id, total: d.total,state:"Pendiente")
          if new_account_detail.save

            #actualiza saldo empleado
            before_balance = Employee.find(d.employee_id).balance
            Employee.find(d.employee_id).update_attribute(:balance, before_balance + d.total)
          end
        end

      end

    end
  end

end