class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t('helpers.breadcrumbs.users.index'), :users_path

  def index
    get_users
  end

  def new
    add_breadcrumb I18n.t('helpers.breadcrumbs.users.new')
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: I18n.t('activerecord.success.messages.users.new')
    else
      render :new
    end
  end

  def edit
    add_breadcrumb I18n.t('helpers.breadcrumbs.users.edit')
  end

  def show
    add_breadcrumb I18n.t('helpers.breadcrumbs.users.show', user: @user.full_name).titleize
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, :notice => "El usuario se edito correctamente."
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private
    def get_users
      @q = User.ransack(params[:q])
      @users = @q.result.page(params[:page])
    end
    def set_user
      @user = User.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
