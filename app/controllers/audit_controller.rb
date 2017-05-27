class AuditController < ApplicationController
  before_action :load_permissions
  authorize_resource
  def index
    add_breadcrumb I18n.t('helpers.breadcrumbs.audits')
    get_audits
  end

  private
  def get_audits
    inicio = Date.parse(busqueda_params[:inicio]) rescue inicio = nil

    fin = Date.parse(busqueda_params[:fin]) rescue fin = nil

    p "inicio " + inicio.to_s + "Fin " + fin.to_s

    #filtro los logs entre las fechas
    if inicio.nil? and fin.nil?
      @q = Audit.all.order(created_at: "desc")
    elsif inicio.nil? and !fin.nil?
      fin = DateTime.new(fin.year, fin.month, fin.day, 23, 59, 59)
      @q = Audit.where("audits.created_at <= ?", fin).order(created_at: "desc")
    elsif !inicio.nil? and fin.nil?
      inicio = DateTime.new(inicio.year, inicio.month, inicio.day, 0, 0, 0)
      @q = Audit.where("audits.created_at >= ?", inicio).order(created_at: "desc")
    elsif !inicio.nil? and !fin.nil?
      inicio = DateTime.new(inicio.year, inicio.month, inicio.day, 0, 0, 0)
      fin = DateTime.new(fin.year, fin.month, fin.day, 23, 59, 59)
      @q = Audit.where('audits.created_at BETWEEN ? AND ?', inicio, fin).order(created_at: "desc")
    else
      @q = Audit.all
      p "???"
    end
    #@q.sorts = ['id desc'] if @q.sorts.empty?
    @audits = @q.page(params[:page])
  end

  def busqueda_params
    params.permit(:inicio, :fin, :commit, :utf8)
  end
end
