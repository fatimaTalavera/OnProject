class MaterialsController < ApplicationController
  add_breadcrumb I18n.t('helpers.breadcrumbs.materials.index'), :materials_path

  before_action :set_material, only: [:show, :edit, :update, :destroy]
  before_action :load_permissions
  authorize_resource

  # GET /materials
  # GET /materials.json
  def index
    get_materials
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
    add_breadcrumb I18n.t('helpers.breadcrumbs.materials.show')
  end

  # GET /materials/new
  def new
    add_breadcrumb I18n.t('helpers.breadcrumbs.materials.new')
    @material = Material.new
  end

  # GET /materials/1/edit
  def edit
    add_breadcrumb I18n.t('helpers.breadcrumbs.materials.edit')
  end

  # POST /materials
  # POST /materials.json
  def create
    @material = Material.new(material_params)

    respond_to do |format|
      if @material.save
        format.html { redirect_to materials_path, notice: 'Has creado el registro con exito.' }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to materials_path, notice: 'Has modificado el registro con exito.' }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materials_url, notice: 'Has eliminido el registro con exito.' }
      format.json { head :no_content }
    end
  end

  private

  def get_materials
    @q = Material.ransack(params[:q])
    @q.sorts = ['name asc'] if @q.sorts.empty?
    @materials = @q.result.page(params[:page])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_material
    @material = Material.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def material_params
    params.require(:material).permit(:name, :description, :price, :quantity, :minimun_stock, :measurement_unit)
  end
end
