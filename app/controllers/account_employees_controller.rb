class AccountEmployeesController < ApplicationController
  before_action :set_account_employee, only: [:show, :edit, :update, :destroy]

  # GET /account_employees
  # GET /account_employees.json
  def index
    get_account_employees
  end

  # GET /account_employees/1
  # GET /account_employees/1.json
  def show
  end

  # GET /account_employees/new
  def new
    @account_employee = AccountEmployee.new
  end

  # GET /account_employees/1/edit
  def edit
    @account_employee.pay = AccountEmployeeDetail.where(account_employee_id: params[:id]).sum(:total)
    @certification = Certification.where(id: AccountEmployeeDetail.where(account_employee_id: params[:id]).pluck(:certification_id))
  end

  # POST /account_employees
  # POST /account_employees.json
  def create
    @account_employee = AccountEmployee.new(account_employee_params)

    respond_to do |format|
      if @account_employee.save
        format.html { redirect_to @account_employee.contract, notice: 'Cta. cte jornalero se creo correctamente' }
        format.json { render :show, status: :created, location: @account_employee }
      else
        format.html { render :new }
        format.json { render json: @account_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_employees/1
  # PATCH/PUT /account_employees/1.json
  def update
    respond_to do |format|
      if @account_employee.update(account_employee_params)
        format.html { redirect_to @account_employee.contract, notice: 'Se actualizo cta. cte. jornalero' }
        format.json { render :show, status: :ok, location: @account_employee }
      else
        format.html { render :edit }
        format.json { render json: @account_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def get_account_employees
      @q = AccountEmployee.ransack(params[:q])
      @q.sorts = ['contract_name asc'] if @q.sorts.empty?
      @account_employees = @q.result.page(params[:page])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_account_employee
      @account_employee = AccountEmployee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_employee_params
      params.require(:account_employee).permit(:contract_id, :pay, :date,
                                               account_employee_details_attributes: [:id, :certification_id, :employee_id, :number_bill, :total, :pay, :date, :state])
    end

end
