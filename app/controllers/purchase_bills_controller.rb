class PurchaseBillsController < ApplicationController
  add_breadcrumb I18n.t('helpers.breadcrumbs.purchase_bills.index'), :purchase_bills_path

  before_action :set_purchase_bill, only: [:show, :edit, :update, :destroy]
  before_action :load_permissions
  authorize_resource

  def index
    get_purchases
  end

  def show
    add_breadcrumb I18n.t('helpers.breadcrumbs.purchase_bills.show', purchase: @purchase_bill.number)
  end

  def new
    add_breadcrumb I18n.t('helpers.breadcrumbs.purchase_bills.new')
    @purchase_bill = PurchaseBill.new
    @purchase_bill.date = Time.now
    @purchase_bill.purchase_details.build
  end

  def edit
    add_breadcrumb I18n.t('helpers.breadcrumbs.purchase_bills.edit')
  end

  def create
    add_breadcrumb I18n.t('helpers.breadcrumbs.purchase_bills.new')
    @purchase_bill = PurchaseBill.new(purchase_bill_params)
    if total_cuotas != @purchase_bill.total && @purchase_bill.condition.crédito?
      flash[:alert] = 'La suma de las cuotas deben ser igual al monto total de la factura.'
      render 'new'
    else
      if @purchase_bill.save
        redirect_to purchase_bills_path, notice: 'La factura de compra ha sido creada correctamente.'
      else
        render 'new'
      end
    end
  end

  def update
    add_breadcrumb I18n.t('helpers.breadcrumbs.purchase_bills.edit')
    @purchase_bill = PurchaseBill.find(params[:id])
    if @purchase_bill.update(purchase_bill_params)
      redirect_to purchase_bills_path, :notice => "La factura se edito correctamente."
    else
      render :edit
    end
  end


  def destroy
    @purchase_bill.destroy
    respond_to do |format|
      format.html { redirect_to purchase_bills_url, notice: 'Purchase bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_purchases
      @q = PurchaseBill.ransack(params[:q])
      @q.sorts = ['date desc'] if @q.sorts.empty?
      @purchase_bills = @q.result.page(params[:page])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_bill
      @purchase_bill = PurchaseBill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_bill_params
      params.require(:purchase_bill).permit(:date, :condition, :number, :total, :balance, :provider_id,
                                            :purchase_details_attributes => [:id, :quantity, :material_id, :price, :total, :_destroy],
                                            :installment_purchases_attributes => [:id, :amount, :balance, :due_date, :_destroy])
    end

    def total_cuotas
      total = 0
      @purchase_bill.installment_purchases.each do |i|
        total += (i.amount ? i.amount : 0)
      end
      return total
    end
end
