class CodclientesController < ApplicationController
  before_action :set_codcliente, only: [:show, :edit, :update, :destroy]

  # GET /codclientes
  # GET /codclientes.json
  def index
    @codclientes = Codcliente.all
  end

  # GET /codclientes/1
  # GET /codclientes/1.json
  def show
  end

  # GET /codclientes/new
  def new
    @codcliente = Codcliente.new
  end

  # GET /codclientes/1/edit
  def edit
  end

  # POST /codclientes
  # POST /codclientes.json
  def create
    @codcliente = Codcliente.new(codcliente_params)

    respond_to do |format|
      if @codcliente.save
        format.html { redirect_to @codcliente, notice: 'Codcliente was successfully created.' }
        format.json { render :show, status: :created, location: @codcliente }
      else
        format.html { render :new }
        format.json { render json: @codcliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codclientes/1
  # PATCH/PUT /codclientes/1.json
  def update
    respond_to do |format|
      if @codcliente.update(codcliente_params)
        format.html { redirect_to @codcliente, notice: 'Codcliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @codcliente }
      else
        format.html { render :edit }
        format.json { render json: @codcliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codclientes/1
  # DELETE /codclientes/1.json
  def destroy
    @codcliente.destroy
    respond_to do |format|
      format.html { redirect_to codclientes_url, notice: 'Codcliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_codcliente
      @codcliente = Codcliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def codcliente_params
      params.require(:codcliente).permit(:numr_codigo, :empresa_id)
    end
end
