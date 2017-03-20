class ContractsController < ApplicationController
  add_breadcrumb I18n.t('helpers.breadcrumbs.contracts.index'), :contracts_path
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  # GET /contracts
  # GET /contracts.json
  def index
    @contracts = Contract.all
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    add_breadcrumb I18n.t('helpers.breadcrumbs.clients.show')
  end

  # GET /contracts/new
  def new
    add_breadcrumb I18n.t('helpers.breadcrumbs.contracts.new')
    @contract = Contract.new
  end

  # GET /contracts/1/edit
  def edit
    add_breadcrumb I18n.t('helpers.breadcrumbs.contracts.edit')
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to contracts_path, notice: 'El contrato se creo correctamente.' }
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
        format.html { redirect_to contracts_path, notice: 'El contrato se modifico correctamente.' }
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
      format.html { redirect_to contracts_url, notice: 'El contrato se elimino correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:client_id, :start_date, :end_date, :name, :amount)
    end
end
