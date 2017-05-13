class SaleBillsController < ApplicationController
  before_action :set_sale_bill, only: [:show, :edit, :update, :destroy]

  # GET /sale_bills
  # GET /sale_bills.json
  def index
    get_sales
  end

  # GET /sale_bills/1
  # GET /sale_bills/1.json
  def show
  end

  # GET /sale_bills/new
  def new
    @sale_bill = SaleBill.new
  end

  # GET /sale_bills/1/edit
  def edit
  end

  # POST /sale_bills
  # POST /sale_bills.json
  def create
    @sale_bill = SaleBill.new(sale_bill_params)

    respond_to do |format|
      if @sale_bill.save
        format.html { redirect_to @sale_bill, notice: 'Sale bill was successfully created.' }
        format.json { render :show, status: :created, location: @sale_bill }
      else
        format.html { render :new }
        format.json { render json: @sale_bill.errors, status: :unprocessable_entity }
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
      @q.sorts = ['id desc'] if @q.sorts.empty?
      @sale_bills = @q.result.page(params[:page])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_sale_bill
      @sale_bill = SaleBill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_bill_params
      params.require(:sale_bill).permit(:date, :condition, :number, :client_id, :contract_id, :total, :balance,
                                        :sale_details_attributes => [:id, :quantity, :concept_id, :certification_id, :price, :total, :_destroy],
                                        :installments_attributes => [:id, :amount, :balance, :due_date, :_destroy])
    end
end
