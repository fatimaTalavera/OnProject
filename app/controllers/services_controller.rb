class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t('helpers.breadcrumbs.services.index'), :services_path

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
    @service = Service.new
  end

  # GET /services/1
  # GET /services/1.json
  def show
    add_breadcrumb I18n.t('helpers.breadcrumbs.services.show')
  end

  # GET /services/new
  def new
    add_breadcrumb I18n.t('helpers.breadcrumbs.services.new')
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
    add_breadcrumb I18n.t('helpers.breadcrumbs.services.edit')
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to services_path, notice: 'El servicio se creo correctamente.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to services_path, notice: 'El servicio se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Servicio se elimino correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :description, :measurement_unit, :price)
    end
end
