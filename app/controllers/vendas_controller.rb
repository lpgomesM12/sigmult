class VendasController < ApplicationController
  before_action :set_venda, only: [:show, :edit, :update, :destroy]


def finalizar_venda

  #verificar se tem caixa aberto
   @caix = Caixa.where(empresa_id: current_user.empresa_id, data_fechamento: nil)
   @caixa_id = 0

   @valor_venda = Itenvenda.where(venda_id: params[:venda_id]).sum(:valr_total)


  if @caix.empty?
    @ca =  Caixa.create(:data_abertura => Time.zone.now,
                        :user_abertura => current_user.id,
                        :empresa_id => current_user.empresa_id,
                        :valr_caixa => @valor_venda)
    @caix_id = @ca.id
  else
    @caixa = Caixa.find(@caix.first.id)
    @caixa.valr_caixa = @caixa.valr_caixa + @valor_venda
    @caixa.save
  end

  #finalizar venda
  @venda = Venda.find(params[:venda_id])
  @venda.situacao = "Finalizada"
  @venda.user_exclusao = current_user.id
  @venda.caixa_id = @caixa.id
  @venda.save

  render :json => true

end

 def cancela_venda

     #Cancelando venda
     @venda = Venda.find(params[:venda_id])
     @venda.situacao = "Cancelada"
     @venda.user_exclusao = current_user.id
     @venda.save

     #buscando itens da venda
     @itensvenda = Itenvenda.where(venda_id: params[:venda_id])

     @itensvenda.each do |item|
       #estornando valores para o estoque dos itens da venda
       @movimentacaoproduto = Movimentacaoproduto.new()
       @movimentacaoproduto.produto_id = item.produto_id
       @movimentacaoproduto.desc_observacao = "Cancelamento de venda"
       @movimentacaoproduto.empresa_id = current_user.empresa_id
       @movimentacaoproduto.user_inclusao = current_user.id
       @movimentacaoproduto.qtd_produto = item.qtd_item
       @movimentacaoproduto.tipo_movimentacao = "ENTRADA"

       @movimentacaoproduto.save
     end

  render :json => {:cancelamento => true}

 end

 def busca_venda
   @venda = Venda.find(params[:venda_id])

   venda_json =  {:id => @venda.id,
                  :numr_codigo => @venda.numr_codigo,
                  :valr_total => @venda.valr_total,
                  :cliente_id => @venda.cliente_id,
                  :nome_cliente => @venda.cliente.nome_cliente,
                  :situacao => @venda.situacao,
                  :formapagamento_id => @venda.formapagamento_id,
                  :nome_formapagamento => @venda.formapagamento.nome_formapagamento,
                  :data_venda => @venda.created_at.strftime("%d/%m/%Y %H:%M:%S")
                 }

   return render :json => venda_json

 end

 #criando uma venda
 def criar_venda
    @venda = Venda.new

    @venda.cliente_id = 1
    @venda.empresa_id = current_user.empresa_id
    @venda.user_inclusao = current_user.id
    @venda.situacao = "Andamento"
    @venda.valr_total = 0
    @venda.formapagamento_id = 1

     if @venda.save
        venda_json =  {:id => @venda.id,
                       :numr_codigo => @venda.numr_codigo,
                       :valr_total => @venda.valr_total,
                       :cliente_id => @venda.cliente_id,
                       :nome_cliente => @venda.cliente.nome_cliente,
                       :situacao => @venda.situacao,
                       :formapagamento_id => @venda.formapagamento_id,
                       :nome_formapagamento => @venda.formapagamento.nome_formapagamento
                      }

       return render :json => venda_json
     end

     cidades = Cidade.where(estado_id: params[:id]).order('nome_cidade ASC')
     cidades_json = cidades.map {|item| {:id => item.id, :nome => item.nome_cidade}}
     render :json => cidades_json

 end

 def pdv

 end

  # GET /vendas
  # GET /vendas.json
  def index
    @vendas = Venda.all
  end

  # GET /vendas/1
  # GET /vendas/1.json
  def show
  end

  # GET /vendas/new
  def new
    @venda = Venda.new
  end

  # GET /vendas/1/edit
  def edit
  end

  # POST /vendas
  # POST /vendas.json
  def create
    @venda = Venda.new(venda_params)

    respond_to do |format|
      if @venda.save
        format.html { redirect_to @venda, notice: 'Venda was successfully created.' }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendas/1
  # PATCH/PUT /vendas/1.json
  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to @venda, notice: 'Venda was successfully updated.' }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1
  # DELETE /vendas/1.json
  def destroy
    @venda.destroy
    respond_to do |format|
      format.html { redirect_to vendas_url, notice: 'Venda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venda
      @venda = Venda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venda_params
      params.require(:venda).permit(:cliente_id, :data_exclusao, :empresa_id, :valr_desconto, :valr_venda, :valr_total, :situacao, :formapagamento_id, :caixa_id)
    end
end
