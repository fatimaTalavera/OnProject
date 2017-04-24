class RolesController < ApplicationController
  add_breadcrumb I18n.t('helpers.breadcrumbs.roles.index'), :roles_path

  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_action :load_permissions
  authorize_resource

  def index
    get_roles
  end

  def new
    add_breadcrumb I18n.t('helpers.breadcrumbs.roles.new')
    @role = Role.new
    15.times {@role.permissions.build}
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to roles_path, :notice => 'El rol se registró correctamente'
    else
      render :new
    end
  end

  def show
    add_breadcrumb I18n.t('helpers.breadcrumbs.roles.show', rol: @role.name).titleize
  end

  def edit
    add_breadcrumb I18n.t('helpers.breadcrumbs.roles.edit')
  end

  def update
    if @role.update(role_params)
      redirect_to roles_path, :notice => "El rol se actulizó correctamente."
    else
      render :edit
    end
  end

  private
  def get_roles
    @q = Role.ransack(params[:q])
    @q.sorts = ['name asc'] if @q.sorts.empty?
    @roles = @q.result.where("id NOT IN(?)", 1).page(params[:page])
  end

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name,:description, :permissions_attributes => [:id, :subject_class, :_destroy, action:[]])
  end
end
