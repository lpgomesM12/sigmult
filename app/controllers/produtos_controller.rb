class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

  include ActionView::Helpers::NumberHelper

 def busca
   @produtos = Produto.search(params[:term],current_user.empresa_id).limit(15)

   @produtos.each do |produto|
     produto.valr_unitario = number_to_currency(produto.valor_custo , unit: "", separator: ",", delimiter: "")
   end

 end

  # GET /produtos
  # GET /produtos.json
  def index
    if params[:q]
       @produtos = Produto.search(params[:q],current_user.empresa_id)
       @q = params[:q]
    else
      @produtos = Produto.where(empresa_id: current_user.empresa_id)
    end
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to produtos_url, notice: 'Produto cadastrado com sucesso' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: 'Produto Alterado com sucesso' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:nome_produto, :desc_observacao, :categoriaproduto_id, :data_exclusao, :qtd_estoqueminimo, :qtd_estoquemaximo, :nome_marca, :cod_barras, :valor_custo, :valor_venda, :desc_tamanho, :status, :peso_kilograma, :user_inclusao, :user_exclusao, :empresa_id, :unidademedida_id)
    end
end
