class ContractsController < ApplicationController
  add_breadcrumb I18n.t('helpers.breadcrumbs.contracts.index'), :contracts_path

  before_action :set_contract, only: [:show, :edit, :update, :destroy]
  before_action :load_permissions
  authorize_resource

  def search
    @contracts = Contract.where('name ILIKE ?', "%#{params[:q][:term]}%")
    render json: {items: @contracts, total_count: @contracts.count}
  end

  # GET /contracts
  # GET /contracts.json
  def index
    get_contracts
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    add_breadcrumb I18n.t('helpers.breadcrumbs.contracts.show')
    @budget_details = @contract.budget_details.page params[:page]
    @material_movements = @contract.material_movements.page params[:page]
    @client_certifications = @contract.client_certifications.page params[:page]
    @internal_certifications = @contract.certifications.page params[:page]
    @sale_bills = @contract.sale_bills.page params[:page]
    @approved = []
    Certification.where(contract_id: @contract.id).each do |c|
      @approved << Certification.find(c.id).state
    end
    @account_employee = @contract.account_employees.page params[:page]
  end

  # GET /contracts/new
  def new
    add_breadcrumb I18n.t('helpers.breadcrumbs.contracts.new')
    @contract = Contract.new
    @contract.budget = Budget.find(params[:budget_id])
    @contract.budget_id = params[:budget_id]
  end

  # GET /contracts/1/edit
  def edit
    add_breadcrumb I18n.t('helpers.breadcrumbs.contracts.edit')
  end

  # POST /contracts
  # POST /contracts.json
  def create
    budget = Budget.find(contract_params[:budget_id])
    @contract = Contract.new_by_budget(contract_params, budget)
    respond_to do |format|
      if @contract.save
        contract = Contract.find(@contract.id)
        budget.update(state: Budget.states[:approved], contract: @contract)
        format.html { redirect_to contract, notice: 'El contrato se creó correctamente.' }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to @contract, notice: 'El contrato se modificó correctamente.' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract.destroy
    respond_to do |format|
      format.html { redirect_to contracts_url, notice: 'El contrato se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def get_contracts
      @q = Contract.ransack(params[:q])
      @q.sorts = ['name asc', 'client_name asc'] if @q.sorts.empty?
      @contracts = @q.result.page(params[:page])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:start_date, :end_date, :budget_id)
    end
end
