class ItenvendasController < ApplicationController
  before_action :set_itenvenda, only: [:show, :edit, :update, :destroy]

  # GET /itenvendas
  # GET /itenvendas.json
  def index
    @itenvendas = Itenvenda.all
  end

  # GET /itenvendas/1
  # GET /itenvendas/1.json
  def show
  end

  # GET /itenvendas/new
  def new
    @itenvenda = Itenvenda.new
  end

  # GET /itenvendas/1/edit
  def edit
  end

  # POST /itenvendas
  # POST /itenvendas.json
  def create
    @itenvenda = Itenvenda.new(itenvenda_params)

    respond_to do |format|
      if @itenvenda.save
        format.html { redirect_to @itenvenda, notice: 'Itenvenda was successfully created.' }
        format.json { render :show, status: :created, location: @itenvenda }
      else
        format.html { render :new }
        format.json { render json: @itenvenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itenvendas/1
  # PATCH/PUT /itenvendas/1.json
  def update
    respond_to do |format|
      if @itenvenda.update(itenvenda_params)
        format.html { redirect_to @itenvenda, notice: 'Itenvenda was successfully updated.' }
        format.json { render :show, status: :ok, location: @itenvenda }
      else
        format.html { render :edit }
        format.json { render json: @itenvenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itenvendas/1
  # DELETE /itenvendas/1.json
  def destroy
    @itenvenda.destroy
    respond_to do |format|
      format.html { redirect_to itenvendas_url, notice: 'Itenvenda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itenvenda
      @itenvenda = Itenvenda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itenvenda_params
      params.require(:itenvenda).permit(:valor_unitario, :qtd_item, :valr_total, :venda_id, :produto_id)
    end
end
