class ItenvendasController < ApplicationController
  before_action :set_itenvenda, only: [:show, :edit, :update, :destroy]

  include ActionView::Helpers::NumberHelper

  def add_item_venda

    @valor_unitario = itenvenda_params[:valor_unitario]
    @valor_unitario = @valor_unitario.gsub('R$', '')
    @valor_unitario = @valor_unitario.gsub('.', '')
    @valor_unitario = @valor_unitario.gsub(',', '.').to_f

    @itemvenda = Itenvenda.new(itenvenda_params)
    @itemvenda.valor_unitario = @valor_unitario
    @itemvenda.user_inclusao = current_user.id

    @itemvenda.save

    render :json => true

  end

  def busca_itens_venda

    itensvenda = Itenvenda.where(venda_id: params[:venda_id])

     @valor_total = 0
     itensvenda.each do |item|
       @valor_total = @valor_total + (item.qtd_item * item.valor_unitario)
     end

    itensvenda_json = itensvenda.map { |item|{:id => item.id,
                                            :valor_unitario => number_to_currency(item.valor_unitario , unit: "", separator: ",", delimiter: ""),
                                            :qtd_item => item.qtd_item,
                                            :venda_id => item.venda_id,
                                            :produto_id => item.produto_id,
                                            :nome_produto => item.produto.nome_produto,
                                            :valor_total => number_to_currency((item.qtd_item * item.valor_unitario) , unit: "", separator: ",", delimiter: ""),
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
      params.require(:itenvenda).permit(:valor_unitario, :qtd_item, :valr_total, :venda_id, :produto_id, :user_inclusao)
    end
end
