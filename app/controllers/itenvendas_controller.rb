class ItenvendasController < ApplicationController
  before_action :set_itenvenda, only: [:show, :edit, :update, :destroy, :atualiza_iten_venda]

  include ActionView::Helpers::NumberHelper

 def atualizar_item_venda

   @valor_unitario = params[:valor_unitario]
   @valor_unitario = @valor_unitario.gsub('R$', '')
   @valor_unitario = @valor_unitario.gsub('.', '')
   @valor_unitario = @valor_unitario.gsub(',', '.').to_f

   @valr_total = params[:valr_total]
   @valr_total = @valr_total.gsub('R$', '')
   @valr_total = @valr_total.gsub('.', '')
   @valr_total = @valr_total.gsub(',', '.').to_f

   @itenvenda = Itenvenda.find(params[:id])

  #verificando se houve alteração na quantidade
  if Integer(@itenvenda.qtd_item) != Integer(params[:qtd_item])

    #setando valores para movimentacao de produtos
    @movimentacaoproduto = Movimentacaoproduto.new()
    @movimentacaoproduto.produto_id = @itenvenda.produto_id
    @movimentacaoproduto.desc_observacao = "Alteração quantidade item venda"
    @movimentacaoproduto.empresa_id = current_user.empresa_id
    @movimentacaoproduto.user_inclusao = current_user.id


     #verificando se a nova quantidade é maior
     if Integer(params[:qtd_item]) > Integer(@itenvenda.qtd_item)

          @diferenca = Integer(params[:qtd_item]) - Integer(@itenvenda.qtd_item)
          @estoque = Estoque.find_by produto_id: @itenvenda.produto_id

          if Integer(@estoque.qtd_produto) >= Integer(@diferenca)
            @movimentacaoproduto.qtd_produto = @diferenca
            @movimentacaoproduto.tipo_movimentacao = "SAIDA"

           else
             return render :json => {:alteracao => false, :msg=> "Estoque insuficiente apenas" +" "+ @estoque.qtd_produto.to_s}
          end

      else
      #valores quando é uma entrada
      @diferenca = Integer(@itenvenda.qtd_item) - Integer(params[:qtd_item])
      @movimentacaoproduto.qtd_produto = @diferenca
      @movimentacaoproduto.tipo_movimentacao = "ENTRADA"

     end
     #salvando uma nova movimentação de produto
     @movimentacaoproduto.save

  end

   @itenvenda.valor_unitario = @valor_unitario
   @itenvenda.valr_total = @valr_total
   @itenvenda.qtd_item = params[:qtd_item]

   @itenvenda.save

   @estoque = Estoque.find_by produto_id: @itenvenda.produto_id
   itenvenda_json =   {:alteracao => true,
                       :id => @itenvenda.id,
                       :nome_item => @itenvenda.produto.nome_produto,
                       :qtd_item => @itenvenda.qtd_item,
                       :preco_item => number_to_currency(@itenvenda.valor_unitario , unit: "", separator: ",", delimiter: ""),
                       :precototal_item => number_to_currency(@itenvenda.valr_total, unit: "", separator: ",", delimiter: ""),
                       :qtd_estoque => @estoque.qtd_produto}

  render :json => itenvenda_json

 end

 def busca_iten_venda
   itenvenda = Itenvenda.find(params[:itenvenda_id])

   @estoque = Estoque.find_by produto_id: itenvenda.produto_id

   itenvenda_json = { :id => itenvenda.id,
                       :nome_item => itenvenda.produto.nome_produto,
                       :qtd_item => itenvenda.qtd_item,
                       :preco_item => number_to_currency(itenvenda.valor_unitario , unit: "", separator: ",", delimiter: ""),
                       :precototal_item => number_to_currency(itenvenda.valr_total, unit: "", separator: ",", delimiter: ""),
                       :qtd_estoque => @estoque.qtd_produto}

  render :json => itenvenda_json
 end

  def add_item_venda

     @estoque = Estoque.find_by produto_id: itenvenda_params[:produto_id]


    #valida disponibilidade de estoque
    if Integer(@estoque.qtd_produto) >= Integer(itenvenda_params[:qtd_item])
        #da baixa no estoque
        @movimentacaoproduto = Movimentacaoproduto.new()
        @movimentacaoproduto.qtd_produto = itenvenda_params[:qtd_item]
        @movimentacaoproduto.tipo_movimentacao = "SAIDA"
        @movimentacaoproduto.produto_id = itenvenda_params[:produto_id]
        @movimentacaoproduto.desc_observacao = "Venda produto"
        @movimentacaoproduto.empresa_id = current_user.empresa_id
        @movimentacaoproduto.user_inclusao = current_user.id
        @movimentacaoproduto.save

        #realiza a venda
        @valor_unitario = itenvenda_params[:valor_unitario]
        @valor_unitario = @valor_unitario.gsub('R$', '')
        @valor_unitario = @valor_unitario.gsub('.', '')
        @valor_unitario = @valor_unitario.gsub(',', '.').to_f

        @itemvenda = Itenvenda.new(itenvenda_params)
        @itemvenda.valor_unitario = @valor_unitario
        @itemvenda.valr_total = @valor_unitario * @itemvenda.qtd_item
        @itemvenda.user_inclusao = current_user.id
        @itemvenda.save
        render :json => {:inclusao => true, :msg=> "Inclusão realizada com sucesso"}
      else
      render :json => {:inclusao => false, :msg=> "Estoque insuficiente apenas" +" "+ @estoque.qtd_produto.to_s}
    end

  end

  def busca_itens_venda
    itensvenda = Itenvenda.where(venda_id: params[:venda_id])
    @valor_total = itensvenda.sum(:valr_total)

    itensvenda_json = itensvenda.map { |item|{:id => item.id,
                                            :valor_unitario => number_to_currency(item.valor_unitario , unit: "", separator: ",", delimiter: ""),
                                            :qtd_item => item.qtd_item,
                                            :venda_id => item.venda_id,
                                            :produto_id => item.produto_id,
                                            :nome_produto => item.produto.nome_produto,
                                            :valor_total => number_to_currency(item.valr_total , unit: "", separator: ",", delimiter: ""),
                                            :valor_tatalvenda => number_to_currency(@valor_total , unit: "", separator: ",", delimiter: "")}}

    render :json => itensvenda_json
  end


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

    #estorno estoque
    @movimentacaoproduto = Movimentacaoproduto.new()
    @movimentacaoproduto.qtd_produto = @itenvenda.qtd_item
    @movimentacaoproduto.tipo_movimentacao = "ENTRADA"
    @movimentacaoproduto.produto_id = @itenvenda.produto_id
    @movimentacaoproduto.desc_observacao = "Estorno exclusão item venda"
    @movimentacaoproduto.empresa_id = current_user.empresa_id
    @movimentacaoproduto.user_inclusao = current_user.id

    @itenvenda.destroy
    @movimentacaoproduto.save
    render :json => true

    # respond_to do |format|
    #   format.html { redirect_to itenvendas_url, notice: 'Itenvenda was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itenvenda
      @itenvenda = Itenvenda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itenvenda_params
      params.require(:itenvenda).permit(:valor_unitario, :qtd_item, :valr_total, :venda_id, :produto_id, :user_inclusao)
    end
end
