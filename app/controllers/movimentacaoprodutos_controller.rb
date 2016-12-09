class MovimentacaoprodutosController < ApplicationController
  before_action :set_movimentacaoproduto, only: [:show, :edit, :update, :destroy]

  # GET /movimentacaoprodutos
  # GET /movimentacaoprodutos.json
  def index
    @movimentacaoprodutos = Movimentacaoproduto.all
  end

  # GET /movimentacaoprodutos/1
  # GET /movimentacaoprodutos/1.json
  def show
  end

  # GET /movimentacaoprodutos/new
  def new
    @movimentacaoproduto = Movimentacaoproduto.new
  end

  # GET /movimentacaoprodutos/1/edit
  def edit
  end

  # POST /movimentacaoprodutos
  # POST /movimentacaoprodutos.json
  def create
    @movimentacaoproduto = Movimentacaoproduto.new(movimentacaoproduto_params)

    respond_to do |format|
      if @movimentacaoproduto.save
        format.html { redirect_to @movimentacaoproduto, notice: 'Movimentacaoproduto was successfully created.' }
        format.json { render :show, status: :created, location: @movimentacaoproduto }
      else
        format.html { render :new }
        format.json { render json: @movimentacaoproduto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimentacaoprodutos/1
  # PATCH/PUT /movimentacaoprodutos/1.json
  def update
    respond_to do |format|
      if @movimentacaoproduto.update(movimentacaoproduto_params)
        format.html { redirect_to @movimentacaoproduto, notice: 'Movimentacaoproduto was successfully updated.' }
        format.json { render :show, status: :ok, location: @movimentacaoproduto }
      else
        format.html { render :edit }
        format.json { render json: @movimentacaoproduto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimentacaoprodutos/1
  # DELETE /movimentacaoprodutos/1.json
  def destroy
    @movimentacaoproduto.destroy
    respond_to do |format|
      format.html { redirect_to movimentacaoprodutos_url, notice: 'Movimentacaoproduto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimentacaoproduto
      @movimentacaoproduto = Movimentacaoproduto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movimentacaoproduto_params
      params.require(:movimentacaoproduto).permit(:qtd_produto, :tipo_movimentacao, :valor_movimentacao, :produto_id, :data_exclusao, :user_inclusao, :user_exclusao)
    end
end
