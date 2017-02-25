class MovementDetailsController < ApplicationController
  before_action :set_movement_detail, only: [:show, :edit, :update, :destroy]

  # GET /movement_details
  # GET /movement_details.json
  def index
    @movement_details = MovementDetail.all
  end

  # GET /movement_details/1
  # GET /movement_details/1.json
  def show
  end

  # GET /movement_details/new
  def new
    @movement_detail = MovementDetail.new
  end

  # GET /movement_details/1/edit
  def edit
  end

  # POST /movement_details
  # POST /movement_details.json
  def create
    @movement_detail = MovementDetail.new(movement_detail_params)

    respond_to do |format|
      if @movement_detail.save
        format.html { redirect_to @movement_detail, notice: 'Movement detail was successfully created.' }
        format.json { render :show, status: :created, location: @movement_detail }
      else
        format.html { render :new }
        format.json { render json: @movement_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movement_details/1
  # PATCH/PUT /movement_details/1.json
  def update
    respond_to do |format|
      if @movement_detail.update(movement_detail_params)
        format.html { redirect_to @movement_detail, notice: 'Movement detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @movement_detail }
      else
        format.html { render :edit }
        format.json { render json: @movement_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movement_details/1
  # DELETE /movement_details/1.json
  def destroy
    @movement_detail.destroy
    respond_to do |format|
      format.html { redirect_to movement_details_url, notice: 'Movement detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement_detail
      @movement_detail = MovementDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movement_detail_params
      params.require(:movement_detail).permit(:material_movement_id, :cantidad)
    end
end
