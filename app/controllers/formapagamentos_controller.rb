class FormapagamentosController < ApplicationController
  before_action :set_formapagamento, only: [:show, :edit, :update, :destroy]

  # GET /formapagamentos
  # GET /formapagamentos.json
  def index
    @formapagamentos = Formapagamento.all
  end

  # GET /formapagamentos/1
  # GET /formapagamentos/1.json
  def show
  end

  # GET /formapagamentos/new
  def new
    @formapagamento = Formapagamento.new
  end

  # GET /formapagamentos/1/edit
  def edit
  end

  # POST /formapagamentos
  # POST /formapagamentos.json
  def create
    @formapagamento = Formapagamento.new(formapagamento_params)

    respond_to do |format|
      if @formapagamento.save
        format.html { redirect_to @formapagamento, notice: 'Formapagamento was successfully created.' }
        format.json { render :show, status: :created, location: @formapagamento }
      else
        format.html { render :new }
        format.json { render json: @formapagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formapagamentos/1
  # PATCH/PUT /formapagamentos/1.json
  def update
    respond_to do |format|
      if @formapagamento.update(formapagamento_params)
        format.html { redirect_to @formapagamento, notice: 'Formapagamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @formapagamento }
      else
        format.html { render :edit }
        format.json { render json: @formapagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formapagamentos/1
  # DELETE /formapagamentos/1.json
  def destroy
    @formapagamento.destroy
    respond_to do |format|
      format.html { redirect_to formapagamentos_url, notice: 'Formapagamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formapagamento
      @formapagamento = Formapagamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formapagamento_params
      params.require(:formapagamento).permit(:nome_formapagamento)
    end
end
