class ConceptsController < ApplicationController
  add_breadcrumb I18n.t('helpers.breadcrumbs.concepts.index'), :concepts_path
  before_action :set_concept, only: [:show, :edit, :update, :destroy]

  # GET /concepts
  # GET /concepts.json
  def index
    get_concepts
  end

  # GET /concepts/1
  # GET /concepts/1.json
  def show
    add_breadcrumb I18n.t('helpers.breadcrumbs.concepts.show')
  end

  # GET /concepts/new
  def new
    add_breadcrumb I18n.t('helpers.breadcrumbs.concepts.new')
    @concept = Concept.new
  end

  # GET /concepts/1/edit
  def edit
    add_breadcrumb I18n.t('helpers.breadcrumbs.concepts.edit')
  end

  # POST /concepts
  # POST /concepts.json
  def create
    @concept = Concept.new(concept_params)

    respond_to do |format|
      if @concept.save
        format.html { redirect_to concepts_path, notice: 'El Concepto se creó correctamente.' }
        format.json { render :show, status: :created, location: @concept }
      else
        format.html { render :new }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concepts/1
  # PATCH/PUT /concepts/1.json
  def update
    respond_to do |format|
      if @concept.update(concept_params)
        format.html { redirect_to concepts_path, notice: 'El Concepto se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @concept }
      else
        format.html { render :edit }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concepts/1
  # DELETE /concepts/1.json
  def destroy
    @concept.destroy
    respond_to do |format|
      format.html { redirect_to concepts_url, notice: 'El Concepto ha sido destruido.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_concepts
      @q = Concept.ransack(params[:q])
      @q.sorts = ['first_name asc'] if @q.sorts.empty?
      @concepts = @q.result.page(params[:page])
    end

    def set_concept
      @concept = Concept.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concept_params
      params.require(:concept).permit(:name)
    end
end
