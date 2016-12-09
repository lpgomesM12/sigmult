class CategoriaempresasController < ApplicationController
  before_action :set_categoriaempresa, only: [:show, :edit, :update, :destroy]

  # GET /categoriaempresas
  # GET /categoriaempresas.json
  def index
    @categoriaempresas = Categoriaempresa.all
  end

  # GET /categoriaempresas/1
  # GET /categoriaempresas/1.json
  def show
  end

  # GET /categoriaempresas/new
  def new
    @categoriaempresa = Categoriaempresa.new
  end

  # GET /categoriaempresas/1/edit
  def edit
  end

  # POST /categoriaempresas
  # POST /categoriaempresas.json
  def create
    @categoriaempresa = Categoriaempresa.new(categoriaempresa_params)

    respond_to do |format|
      if @categoriaempresa.save
        format.html { redirect_to @categoriaempresa, notice: 'Categoria cadastrada com sucesso.' }
        format.json { render :show, status: :created, location: @categoriaempresa }
      else
        format.html { render :new }
        format.json { render json: @categoriaempresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoriaempresas/1
  # PATCH/PUT /categoriaempresas/1.json
  def update
    respond_to do |format|
      if @categoriaempresa.update(categoriaempresa_params)
        format.html { redirect_to @categoriaempresa, notice: 'Categoria alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @categoriaempresa }
      else
        format.html { render :edit }
        format.json { render json: @categoriaempresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoriaempresas/1
  # DELETE /categoriaempresas/1.json
  def destroy
    @categoriaempresa.destroy
    respond_to do |format|
      format.html { redirect_to categoriaempresas_url, notice: 'Categoria excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoriaempresa
      @categoriaempresa = Categoriaempresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoriaempresa_params
      params.require(:categoriaempresa).permit(:nome_categoria, :desc_descricao)
    end
end
