class ClientsController < ApplicationController
  add_breadcrumb I18n.t('helpers.breadcrumbs.clients.index'), :clients_path

  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :load_permissions
  authorize_resource

  # GET /clients
  # GET /clients.json
  def index
    get_clients
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    add_breadcrumb I18n.t('helpers.breadcrumbs.clients.show')
  end

  # GET /clients/new
  def new
    add_breadcrumb I18n.t('helpers.breadcrumbs.clients.new')
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
    add_breadcrumb I18n.t('helpers.breadcrumbs.clients.edit')
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_path, notice: 'El cliente se creo correctamente.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to clients_path, notice: 'El cliente se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Cliente se elimino correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def get_clients
      @q = Client.ransack(params[:q])
      @q.sorts = ['first_name asc', 'ruc asc'] if @q.sorts.empty?
      @clients = @q.result.page(params[:page])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :last_name, :ruc, :email, :adress, :phone)
    end
end
