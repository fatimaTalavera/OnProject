class InternalCertificationsController < ApplicationController
  add_breadcrumb I18n.t('helpers.breadcrumbs.internal_certifications.index'), :employees_path
  before_action :set_internal_certification, only: [:show, :edit, :update, :destroy]

  # GET /internal_certifications
  # GET /internal_certifications.json
  def index
    get_certifications
  end

  # GET /internal_certifications/new
  def new
    @internal_certification = InternalCertification.new
  end

  # GET /internal_certifications/1/edit
  def edit
  end

  # POST /internal_certifications
  # POST /internal_certifications.json
  def create
    @internal_certification = InternalCertification.new(internal_certification_params)

    respond_to do |format|
      if @internal_certification.save
        format.html { redirect_to internal_certifications_path, notice: 'La certificación interna ha sido creada correctamente.' }
        format.json { render :show, status: :created, location: @internal_certification }
      else
        format.html { render :new }
        format.json { render json: @internal_certification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internal_certifications/1
  # PATCH/PUT /internal_certifications/1.json
  def update
    respond_to do |format|
      if @internal_certification.update(internal_certification_params)
        format.html { redirect_to internal_certifications_path, notice: 'La certificación interna ha sido editada correctamente' }
        format.json { render :show, status: :ok, location: @internal_certification }
      else
        format.html { render :edit }
        format.json { render json: @internal_certification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internal_certifications/1
  # DELETE /internal_certifications/1.json
  def destroy
    @internal_certification.destroy
    respond_to do |format|
      format.html { redirect_to internal_certifications_url, notice: 'Internal certification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def get_certifications
    @q = InternalCertification.ransack(params[:q])
    @q.sorts = ['date asc'] if @q.sorts.empty?
    @internal_certifications = @q.result.page(params[:page])
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_internal_certification
      @internal_certification = InternalCertification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internal_certification_params
      params.require(:internal_certification).permit(:date, :amount, :discount, :employee_id, :contract_id)
    end
end
