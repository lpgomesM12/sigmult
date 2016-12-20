class FornecedorsController < ApplicationController
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]

  def busca
   @fornecedors = Fornecedor.search(params[:term]).limit(10)
  end

  # GET /fornecedors
  # GET /fornecedors.json
  def index
    @fornecedors = Fornecedor.all
  end

  # GET /fornecedors/1
  # GET /fornecedors/1.json
  def show
  end

  # GET /fornecedors/new
  def new
    @fornecedor = Fornecedor.new
    @fornecedor.build_endereco
    @fornecedor.telefonefornecedors.build
  end

  # GET /fornecedors/1/edit
  def edit
  end

  # POST /fornecedors
  # POST /fornecedors.json
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    respond_to do |format|
      if @fornecedor.save
        format.html { redirect_to @fornecedor, notice: 'Fornecedor cadastrao com sucesso.' }
        format.json { render :show, status: :created, location: @fornecedor }
      else
        format.html { render :new }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fornecedors/1
  # PATCH/PUT /fornecedors/1.json
  def update
    respond_to do |format|
      if @fornecedor.update(fornecedor_params)
        format.html { redirect_to @fornecedor, notice: 'Fornecedor alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @fornecedor }
      else
        format.html { render :edit }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedors/1
  # DELETE /fornecedors/1.json
  def destroy
    @fornecedor.destroy
    respond_to do |format|
      format.html { redirect_to fornecedors_url, notice: 'Fornecedor deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fornecedor_params
      params.require(:fornecedor).permit(:nome_fornecedor, :desc_cnpj, :empresa_id, endereco_attributes: [ :id, :endereco, :desc_cep, :cidade_id], telefonefornecedors_attributes: [:id, :desc_telefone, :desc_tipo, :_destroy])
    end
end
