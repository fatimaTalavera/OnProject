class CertificationsController < ApplicationController
  add_breadcrumb I18n.t('helpers.breadcrumbs.certifications.index'), :certifications_path
  before_action :set_certification, only: [:show, :edit, :update]

  def index
    get_certifications
  end

  def new
    add_breadcrumb I18n.t('helpers.breadcrumbs.certifications.new')
    @certification = Certification.new
  end

  def show
    add_breadcrumb I18n.t('helpers.breadcrumbs.certifications.show')
  end

  def edit
    add_breadcrumb I18n.t('helpers.breadcrumbs.certifications.edit')
  end

  def create
    @certification = Certification.new(certification_params)
    respond_to do |format|
      if @certification.save
        format.html { redirect_to certifications_path, notice: 'Certificación interna se creó correctamente' }
        format.json { render :show, status: :created, location: @certification }
      else
        format.html { render :new }
        format.json { render json: @certification.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @certification.update(certification_params)
        format.html { redirect_to certifications_path, notice: 'Certificación interna se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @certification }
      else
        format.html { render :edit }
        format.json { render json: @certification.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def get_certifications
      @q = Certification.ransack(params[:q])
      @q.sorts = ['contract_name asc'] if @q.sorts.empty?
      @certifications = @q.result.page(params[:page])
    end
    def set_certification
     @certification = Certification.find(params[:id])
    end

    def certification_params
      params.require(:certification).permit(:contract_id, :date, :certification_details_attributes => [:id, :employee_id, :quantity, :pay, :discount, :observation, :subtotal, :total, :_destroy])
    end
end
