class ApplicationController < ActionController::Base

  add_breadcrumb I18n.t('helpers.breadcrumbs.dashboard'), :root_path

  layout :layout_by_resource

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception


  def layout_by_resource
  	if devise_controller?
  		"login"
  	else
  		"application"
  	end
  end
end
