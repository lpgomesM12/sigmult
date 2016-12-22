class CodvendasController < ApplicationController
  before_action :set_codvenda, only: [:show, :edit, :update, :destroy]

  # GET /codvendas
  # GET /codvendas.json
  def index
    @codvendas = Codvenda.all
  end

  # GET /codvendas/1
  # GET /codvendas/1.json
  def show
  end

  # GET /codvendas/new
  def new
    @codvenda = Codvenda.new
  end

  # GET /codvendas/1/edit
  def edit
  end

  # POST /codvendas
  # POST /codvendas.json
  def create
    @codvenda = Codvenda.new(codvenda_params)

    respond_to do |format|
      if @codvenda.save
        format.html { redirect_to @codvenda, notice: 'Codvenda was successfully created.' }
        format.json { render :show, status: :created, location: @codvenda }
      else
        format.html { render :new }
        format.json { render json: @codvenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codvendas/1
  # PATCH/PUT /codvendas/1.json
  def update
    respond_to do |format|
      if @codvenda.update(codvenda_params)
        format.html { redirect_to @codvenda, notice: 'Codvenda was successfully updated.' }
        format.json { render :show, status: :ok, location: @codvenda }
      else
        format.html { render :edit }
        format.json { render json: @codvenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codvendas/1
  # DELETE /codvendas/1.json
  def destroy
    @codvenda.destroy
    respond_to do |format|
      format.html { redirect_to codvendas_url, notice: 'Codvenda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_codvenda
      @codvenda = Codvenda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def codvenda_params
      params.require(:codvenda).permit(:numr_contador, :empresa_id)
    end
end
