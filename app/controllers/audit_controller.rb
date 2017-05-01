class AuditController < ApplicationController
  before_action :load_permissions
  authorize_resource
  def index
    add_breadcrumb I18n.t('helpers.breadcrumbs.audits')
    get_audits
  end

  private
  def get_audits
    @q = Audit.ransack(params[:q])
    @q.sorts = ['id desc'] if @q.sorts.empty?
    @audits = @q.result.page(params[:page])
  end
end