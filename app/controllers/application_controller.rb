class ApplicationController < ActionController::Base

  add_breadcrumb I18n.t('helpers.breadcrumbs.dashboard'), :root_path

  layout :layout_by_resource

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery prepend: true

  helper_method :find_user

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "No tienes permiso para acceder a la página solicitada"
  end

  def layout_by_resource
  	if devise_controller?
  		"login"
  	else
  		"application"
  	end
  end

  def find_user(id)
    User.find(id)
  end

  protected

  #derive the model name from the controller. egs UsersController will return User
  def self.permission
    return name = self.name.gsub('Controller','').singularize.split('::').last.constantize.name rescue nil
  end

  #load the permissions for the current user so that UI can be manipulated
  def load_permissions
    @current_permissions = current_user.role.permissions.collect{|i| [i.subject_class, i.action]}
  end

end
