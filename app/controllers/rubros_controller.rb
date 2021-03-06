class RubrosController < ApplicationController
  before_action :set_rubro, only: [:show, :edit, :update, :destroy]
  before_action :load_permissions
  authorize_resource
  add_breadcrumb I18n.t('helpers.breadcrumbs.rubros.index'), :rubros_path

  def search
    @rubros = Rubro.where('name ILIKE ?', "%#{params[:q][:term]}%")
    render json: {items: @rubros, total_count: @rubros.count}
  end
  # GET /rubros
  # GET /rubros.json
  def index
    get_rubros
  end

  # GET /rubros/1
  # GET /rubros/1.json
  def show
    add_breadcrumb I18n.t('helpers.breadcrumbs.rubros.show')
  end

  # GET /rubros/new
  def new
    add_breadcrumb I18n.t('helpers.breadcrumbs.rubros.new')
    @rubro = Rubro.new
    @rubro.utility = CompanyConfig.first.default_utility
    @rubro.rubro_material_details.build
    @rubro.rubro_service_details.build
  end

  # GET /rubros/1/edit
  def edit
    add_breadcrumb I18n.t('helpers.breadcrumbs.rubros.edit')
  end

  # POST /rubros
  # POST /rubros.json
  def create
    @rubro = Rubro.new(rubro_params)

    respond_to do |format|
      if @rubro.save
        format.html { redirect_to @rubro, notice: 'El rubro ha sido creado correctamente' }
        format.json { render :show, status: :created, location: @rubro }
      else
        format.html { render :new }
        format.json { render json: @rubro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rubros/1
  # PATCH/PUT /rubros/1.json
  def update
    respond_to do |format|
      if @rubro.update(rubro_params)
        format.html { redirect_to @rubro, notice: 'El rubro ha sido actualizado correctamente' }
        format.json { render :show, status: :ok, location: @rubro }
      else
        format.html { render :edit }
        format.json { render json: @rubro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rubros/1
  # DELETE /rubros/1.json
  def destroy
    @rubro.destroy
    respond_to do |format|
      format.html { redirect_to rubros_url, notice: 'El rubro ha sido eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def get_rubros
      @q = Rubro.ransack(params[:q])
      @q.sorts = ['name asc'] if @q.sorts.empty?
      @rubros = @q.result.page(params[:page])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_rubro
      @rubro = Rubro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rubro_params
      params.require(:rubro).permit(:name, :utility, :measurement_unit,
                                    :rubro_material_details_attributes => [:id, :material_id, :quantity, :price, :measurement_unit, :subtotal, :_destroy],
                                    :rubro_service_details_attributes => [:id, :service_id, :quantity, :price, :measurement_unit, :subtotal, :_destroy])
    end
end
