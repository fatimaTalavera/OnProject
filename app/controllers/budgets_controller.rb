class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t('helpers.breadcrumbs.budgets.index'), :budgets_path

  # GET /budgets
  # GET /budgets.json
  def index
    get_budgets
  end

  # GET /budgets/1
  # GET /budgets/1.json
  def show
    add_breadcrumb I18n.t('helpers.breadcrumbs.budgets.show')
    @budget_service_details = BudgetServiceDetail.all
  end

  # GET /budgets/new
  def new
    add_breadcrumb I18n.t('helpers.breadcrumbs.budgets.new')
    @budget = Budget.new


  end

  # GET /budgets/1/edit
  def edit
    add_breadcrumb I18n.t('helpers.breadcrumbs.budgets.edit')
  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = Budget.new(budget_params)

    respond_to do |format|
      if @budget.save
        format.html { redirect_to budgets_path, notice: 'El presupuesto se creo correctamente' }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :new }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/1
  # PATCH/PUT /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to budgets_path, notice: 'El presupuesto se actualizo correctamente' }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget.destroy

    respond_to do |format|
      format.html { redirect_to budgets_url, notice: 'Budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def get_budgets
    @q = Budget.ransack(params[:q])
    @q.sorts = ['name asc'] if @q.sorts.empty?
    @budgets = @q.result.page(params[:page])
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_params
      params.require(:budget).permit(:client_id, :date, :description, :utility, :state, :total_service, :total_material, :total_amount,
        budget_service_details_attributes: [:id, :service_id, :service_price, :service_quantity, :subtotal, :_destroy],
                                     budget_material_details_attributes: [:id, :material_id, :material_price, :material_quantity, :subtotal, :_destroy])
    end
end
