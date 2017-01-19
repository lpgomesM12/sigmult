class LancamentosController < ApplicationController
  before_action :set_lancamento, only: [:show, :edit, :update, :destroy]

  include ActionView::Helpers::NumberHelper

 def lancamentos
   @lancamentos = Lancamento.where(empresa_id: current_user.empresa_id)

   json_lancamento = @lancamentos.map { |item| {:id => item.id,
                                         :data_vencimento => item.data_vencimento.blank? ? '' : item.data_vencimento.strftime("%d/%m/%Y"),
                                         :valr_lancamento => number_to_currency(item.valr_lancamento , unit: "R$", separator: ",", delimiter: ""),
                                         :data_pagamento => item.data_pagamento.blank? ? '' : item.data_pagamento.strftime("%d/%m/%Y"),
                                         :nome_lancamento => item.nome_lancamento}}

  render :json => json_lancamento
 end

  # GET /lancamentos
  # GET /lancamentos.json
  def index
    @lancamentos = Lancamento.all
  end

  # GET /lancamentos/1
  # GET /lancamentos/1.json
  def show
  end

  # GET /lancamentos/new
  def new
    @lancamento = Lancamento.new
  end

  # GET /lancamentos/1/edit
  def edit
  end

  # POST /lancamentos
  # POST /lancamentos.json
  def create
    @lancamento = Lancamento.new(lancamento_params)

    respond_to do |format|
      if @lancamento.save
        format.html { redirect_to @lancamento, notice: 'Lancamento was successfully created.' }
        format.json { render :show, status: :created, location: @lancamento }
      else
        format.html { render :new }
        format.json { render json: @lancamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lancamentos/1
  # PATCH/PUT /lancamentos/1.json
  def update
    respond_to do |format|
      if @lancamento.update(lancamento_params)
        format.html { redirect_to @lancamento, notice: 'Lancamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @lancamento }
      else
        format.html { render :edit }
        format.json { render json: @lancamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lancamentos/1
  # DELETE /lancamentos/1.json
  def destroy
    @lancamento.destroy
    respond_to do |format|
      format.html { redirect_to lancamentos_url, notice: 'Lancamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lancamento
      @lancamento = Lancamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lancamento_params
      params.require(:lancamento).permit(:nome_lancamento, :valr_lancamento, :valr_desconto, :data_vencimento, :data_pagamento, :flag_pago, :numr_recorrencia, :numr_parcela, :numr_referenciparcela, :categoriafinaceiro_id, :formapagamento_id, :fornecedor_id, :situacao, :data_exclusao, :tipo_lancamento, :empresa_id, :valr_juros)
    end
end
