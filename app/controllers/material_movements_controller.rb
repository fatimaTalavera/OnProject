class MaterialMovementsController < ApplicationController
  add_breadcrumb I18n.t('helpers.breadcrumbs.material_movements'), :material_movements_path
  before_action :set_material_movement, only: [:show, :edit, :update, :destroy]

  # GET /material_movements
  # GET /material_movements.json
  def index
    get_movements
  end

  # GET /material_movements/1
  # GET /material_movements/1.json
  def show
    @material_movements = MaterialMovement.all
  end

  # GET /material_movements/new
  def new
    @material_movement = MaterialMovement.new
  end

  # GET /material_movements/1/edit
  def edit
  end

  # POST /material_movements
  # POST /material_movements.json
  def create
    @material_movement = MaterialMovement.new(material_movement_params)

    respond_to do |format|
      if @material_movement.save
        format.html { redirect_to material_movements_url, notice: 'El movimiento ha sido creado correctamente.' }
        format.json { render :show, status: :created, location: @material_movement }
      else
        format.html { render :new }
        format.json { render json: @material_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_movements/1
  # PATCH/PUT /material_movements/1.json
  def update
    respond_to do |format|
      if @material_movement.update(material_movement_params)
        format.html { redirect_to @material_movement, notice: 'El movimiento ha sido editado correctamente.' }
        format.json { render :show, status: :ok, location: @material_movement }
      else
        format.html { render :edit }
        format.json { render json: @material_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_movements/1
  # DELETE /material_movements/1.json
  def destroy
    @material_movement.destroy
    respond_to do |format|
      format.html { redirect_to material_movements_url, notice: 'El movimiento ha sido eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def get_movements
      @q = MaterialMovement.ransack(params[:q])
      @q.sorts = ['fecha desc'] if @q.sorts.empty?
      @material_movements = @q.result.page(params[:page])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_material_movement
      @material_movement = MaterialMovement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_movement_params
      params.require(:material_movement).permit(:fecha, :motivo, :contract_id,
        :movement_details_attributes => [:id, :cantidad, :material_id, :_destroy])
    end
end
