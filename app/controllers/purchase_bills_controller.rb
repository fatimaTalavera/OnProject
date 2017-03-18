class PurchaseBillsController < ApplicationController
  add_breadcrumb I18n.t('helpers.breadcrumbs.purchase_bills'), :purchase_bills_path
  before_action :set_purchase_bill, only: [:show, :edit, :update, :destroy]

  # GET /purchase_bills
  # GET /purchase_bills.json
  def index
    @purchase_bills = PurchaseBill.all
    @purchase_bill = PurchaseBill.new
  end

  # GET /purchase_bills/1
  # GET /purchase_bills/1.json
  def show
  end

  # GET /purchase_bills/new
  def new
    @purchase_bill = PurchaseBill.new
  end

  # GET /purchase_bills/1/edit
  def edit
  end

  # POST /purchase_bills
  # POST /purchase_bills.json
  def create
    @purchase_bill = PurchaseBill.new(purchase_bill_params)

    respond_to do |format|
      if @purchase_bill.save
        format.html { redirect_to @purchase_bill, notice: 'Purchase bill was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_bill }
      else
        format.html { render :new }
        format.json { render json: @purchase_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_bills/1
  # PATCH/PUT /purchase_bills/1.json
  def update
    respond_to do |format|
      if @purchase_bill.update(purchase_bill_params)
        format.html { redirect_to @purchase_bill, notice: 'Purchase bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_bill }
      else
        format.html { render :edit }
        format.json { render json: @purchase_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_bills/1
  # DELETE /purchase_bills/1.json
  def destroy
    @purchase_bill.destroy
    respond_to do |format|
      format.html { redirect_to purchase_bills_url, notice: 'Purchase bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_bill
      @purchase_bill = PurchaseBill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_bill_params
      params.require(:purchase_bill).permit(:date, :condition, :number,
                                            :purchase_details_attributes => [:id, :quantity, :material_id, :price, :_destroy])
    end
end
