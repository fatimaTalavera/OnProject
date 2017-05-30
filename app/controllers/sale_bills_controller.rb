class SaleBillsController < ApplicationController
  add_breadcrumb I18n.t('helpers.breadcrumbs.sale_bills.index'), :sale_bills_path
  before_action :set_sale_bill, only: [:show, :edit, :update, :destroy]
  before_action :load_permissions
  authorize_resource

  # GET /sale_bills
  # GET /sale_bills.json
  def index
    get_sales
  end

  # GET /sale_bills/1
  # GET /sale_bills/1.json
  def show
    add_breadcrumb I18n.t('helpers.breadcrumbs.sale_bills.show', sale: @sale_bill.number)
  end

  # GET /sale_bills/new
  def new
    add_breadcrumb I18n.t('helpers.breadcrumbs.sale_bills.new')
    @sale_bill = SaleBill.new
    unless params[:contract_id].nil?
      @sale_bill.contract = Contract.find(params[:contract_id])
      @sale_bill.contract_id = params[:contract_id]
    end
    @sale_bill.date = Time.now
    @sale_bill.sale_details.build
  end

  # GET /sale_bills/1/edit
  def edit
    add_breadcrumb I18n.t('helpers.breadcrumbs.sale_bills.edit')
  end

  # POST /sale_bills
  # POST /sale_bills.json
  def create
    add_breadcrumb I18n.t('helpers.breadcrumbs.sale_bills.new')
    @sale_bill = SaleBill.new(sale_bill_params)
    if total_cuotas != @sale_bill.total && @sale_bill.condition.crédito?
      flash[:alert] = 'La suma de las cuotas deben ser igual al monto total de la factura.'
      render 'new'
    else
      if @sale_bill.save
        redirect_to sale_bills_path, notice: 'La factura de venta ha sido creada correctamente.'
      else
        render 'new'
      end
    end
  end

  # PATCH/PUT /sale_bills/1
  # PATCH/PUT /sale_bills/1.json
  def update
    respond_to do |format|
      if @sale_bill.update(sale_bill_params)
        format.html { redirect_to @sale_bill, notice: 'Sale bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale_bill }
      else
        format.html { render :edit }
        format.json { render json: @sale_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def get_sales
      @q = SaleBill.ransack(params[:q])
      @q.sorts = ['created_at desc'] if @q.sorts.empty?
      @sale_bills = @q.result.page(params[:page])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_sale_bill
      @sale_bill = SaleBill.find(params[:id])
    end

    def total_cuotas
      total = 0
      @sale_bill.installments.each do |i|
        total += (i.amount ? i.amount : 0)
      end
      return total
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_bill_params
      params.require(:sale_bill).permit(:date, :condition, :number, :contract_id, :total, :balance,
                                        :sale_details_attributes => [:id, :quantity, :concept, :certification_id, :price, :total, :_destroy],
                                        :installments_attributes => [:id, :amount, :balance, :due_date, :_destroy])
    end
end
