class CompanyConfigController < ApplicationController
  add_breadcrumb I18n.t('helpers.breadcrumbs.company_config.index')

  before_action :load_permissions
  authorize_resource

  def edit_company
    @company_config = CompanyConfig.first
  end

  def update_company
    @company_config = CompanyConfig.first
    if @company_config.update(company_config_params)
      redirect_to edit_company_path, :notice => "Los datos de la empresa se actualizaron correctamente."
    else
      render :edit_company
    end
  end

  private
    def company_config_params
      params.require(:company_config).permit(:name, :address, :email, :tel_fax, :celphone, :avatar, :current_avatar)
    end
end
