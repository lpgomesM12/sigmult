class UnidademedidasController < ApplicationController
  before_action :set_unidademedida, only: [:show, :edit, :update, :destroy]

  # GET /unidademedidas
  # GET /unidademedidas.json
  def index
    @unidademedidas = Unidademedida.all
  end

  # GET /unidademedidas/1
  # GET /unidademedidas/1.json
  def show
  end

  # GET /unidademedidas/new
  def new
    @unidademedida = Unidademedida.new
  end

  # GET /unidademedidas/1/edit
  def edit
  end

  # POST /unidademedidas
  # POST /unidademedidas.json
  def create
    @unidademedida = Unidademedida.new(unidademedida_params)

    respond_to do |format|
      if @unidademedida.save
        format.html { redirect_to @unidademedida, notice: 'Unidademedida was successfully created.' }
        format.json { render :show, status: :created, location: @unidademedida }
      else
        format.html { render :new }
        format.json { render json: @unidademedida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unidademedidas/1
  # PATCH/PUT /unidademedidas/1.json
  def update
    respond_to do |format|
      if @unidademedida.update(unidademedida_params)
        format.html { redirect_to @unidademedida, notice: 'Unidademedida was successfully updated.' }
        format.json { render :show, status: :ok, location: @unidademedida }
      else
        format.html { render :edit }
        format.json { render json: @unidademedida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidademedidas/1
  # DELETE /unidademedidas/1.json
  def destroy
    @unidademedida.destroy
    respond_to do |format|
      format.html { redirect_to unidademedidas_url, notice: 'Unidademedida was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidademedida
      @unidademedida = Unidademedida.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unidademedida_params
      params.require(:unidademedida).permit(:nome_unidade, :empresa_id)
    end
end
