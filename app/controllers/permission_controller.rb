class PermissionsController < ApplicationController
  before_action :set_permission, only: [:update, :destroy]
  before_action :load_permissions
  load_and_authorize_resource

  def create
    @permission = Permission.new(permission_params)
    @permission.save
  end

  def update
    @permission.update(permission_params)
  end

  def destroy
    @permission.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission
      @permission = Permission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permission_params
      params.require(:permission).permit(:subject_class, :role_id, action:[])
    end
end
