class CompanyConfigController < ApplicationController
  before_action :set_company_config, only: [:edit, :update]
  add_breadcrumb I18n.t('helpers.breadcrumbs.company_config.index'), :edit_company_config_path

  def index
    redirect_to edit_company_config_path(CompanyConfig.first)
  end

  def edit
  end

  def update
    @company_config = CompanyConfig.find(params[:id])
    if @company_config.update(company_config_params)
      redirect_to company_config_index_path, :notice => "Los datos de la empresa se actualizaron correctamente."
    else
      render :edit
    end
  end

  private
    def set_company_config
      @company_config = CompanyConfig.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def company_config_params
      params.require(:company_config).permit(:name, :address, :email, :tel_fax, :celphone, :avatar)
    end
end
