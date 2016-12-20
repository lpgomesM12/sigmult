class TipomovifinanceirosController < ApplicationController
  before_action :set_tipomovifinanceiro, only: [:show, :edit, :update, :destroy]

  # GET /tipomovifinanceiros
  # GET /tipomovifinanceiros.json
  def index
    @tipomovifinanceiros = Tipomovifinanceiro.all
  end

  # GET /tipomovifinanceiros/1
  # GET /tipomovifinanceiros/1.json
  def show
  end

  # GET /tipomovifinanceiros/new
  def new
    @tipomovifinanceiro = Tipomovifinanceiro.new
  end

  # GET /tipomovifinanceiros/1/edit
  def edit
  end

  # POST /tipomovifinanceiros
  # POST /tipomovifinanceiros.json
  def create
    @tipomovifinanceiro = Tipomovifinanceiro.new(tipomovifinanceiro_params)

    respond_to do |format|
      if @tipomovifinanceiro.save
        format.html { redirect_to @tipomovifinanceiro, notice: 'Tipomovifinanceiro was successfully created.' }
        format.json { render :show, status: :created, location: @tipomovifinanceiro }
      else
        format.html { render :new }
        format.json { render json: @tipomovifinanceiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipomovifinanceiros/1
  # PATCH/PUT /tipomovifinanceiros/1.json
  def update
    respond_to do |format|
      if @tipomovifinanceiro.update(tipomovifinanceiro_params)
        format.html { redirect_to @tipomovifinanceiro, notice: 'Tipomovifinanceiro was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipomovifinanceiro }
      else
        format.html { render :edit }
        format.json { render json: @tipomovifinanceiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipomovifinanceiros/1
  # DELETE /tipomovifinanceiros/1.json
  def destroy
    @tipomovifinanceiro.destroy
    respond_to do |format|
      format.html { redirect_to tipomovifinanceiros_url, notice: 'Tipomovifinanceiro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipomovifinanceiro
      @tipomovifinanceiro = Tipomovifinanceiro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipomovifinanceiro_params
      params.require(:tipomovifinanceiro).permit(:nome_movimento)
    end
end
