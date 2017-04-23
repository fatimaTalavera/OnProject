class AuditController < ApplicationController
  def index
    get_audits
  end

  private
  def get_audits
    @q = Audit.ransack(params[:q])
    @q.sorts = ['id asc'] if @q.sorts.empty?
    @audits = @q.result.page(params[:page])
  end
end
