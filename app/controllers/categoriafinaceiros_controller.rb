class CategoriafinaceirosController < ApplicationController
  before_action :set_categoriafinaceiro, only: [:show, :edit, :update, :destroy]

  # GET /categoriafinaceiros
  # GET /categoriafinaceiros.json
  def index
    @categoriafinaceiros = Categoriafinaceiro.all
  end

  # GET /categoriafinaceiros/1
  # GET /categoriafinaceiros/1.json
  def show
  end

  # GET /categoriafinaceiros/new
  def new
    @categoriafinaceiro = Categoriafinaceiro.new
  end

  # GET /categoriafinaceiros/1/edit
  def edit
  end

  # POST /categoriafinaceiros
  # POST /categoriafinaceiros.json
  def create
    @categoriafinaceiro = Categoriafinaceiro.new(categoriafinaceiro_params)

    respond_to do |format|
      if @categoriafinaceiro.save
        format.html { redirect_to @categoriafinaceiro, notice: 'Categoriafinaceiro was successfully created.' }
        format.json { render :show, status: :created, location: @categoriafinaceiro }
      else
        format.html { render :new }
        format.json { render json: @categoriafinaceiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoriafinaceiros/1
  # PATCH/PUT /categoriafinaceiros/1.json
  def update
    respond_to do |format|
      if @categoriafinaceiro.update(categoriafinaceiro_params)
        format.html { redirect_to @categoriafinaceiro, notice: 'Categoriafinaceiro was successfully updated.' }
        format.json { render :show, status: :ok, location: @categoriafinaceiro }
      else
        format.html { render :edit }
        format.json { render json: @categoriafinaceiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoriafinaceiros/1
  # DELETE /categoriafinaceiros/1.json
  def destroy
    @categoriafinaceiro.destroy
    respond_to do |format|
      format.html { redirect_to categoriafinaceiros_url, notice: 'Categoriafinaceiro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoriafinaceiro
      @categoriafinaceiro = Categoriafinaceiro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoriafinaceiro_params
      params.require(:categoriafinaceiro).permit(:nome_categoria, :empresa_id)
    end
end
