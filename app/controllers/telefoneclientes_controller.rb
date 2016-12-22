class TelefoneclientesController < ApplicationController
  before_action :set_telefonecliente, only: [:show, :edit, :update, :destroy]

  # GET /telefoneclientes
  # GET /telefoneclientes.json
  def index
    @telefoneclientes = Telefonecliente.all
  end

  # GET /telefoneclientes/1
  # GET /telefoneclientes/1.json
  def show
  end

  # GET /telefoneclientes/new
  def new
    @telefonecliente = Telefonecliente.new
  end

  # GET /telefoneclientes/1/edit
  def edit
  end

  # POST /telefoneclientes
  # POST /telefoneclientes.json
  def create
    @telefonecliente = Telefonecliente.new(telefonecliente_params)

    respond_to do |format|
      if @telefonecliente.save
        format.html { redirect_to @telefonecliente, notice: 'Telefonecliente was successfully created.' }
        format.json { render :show, status: :created, location: @telefonecliente }
      else
        format.html { render :new }
        format.json { render json: @telefonecliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telefoneclientes/1
  # PATCH/PUT /telefoneclientes/1.json
  def update
    respond_to do |format|
      if @telefonecliente.update(telefonecliente_params)
        format.html { redirect_to @telefonecliente, notice: 'Telefonecliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @telefonecliente }
      else
        format.html { render :edit }
        format.json { render json: @telefonecliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telefoneclientes/1
  # DELETE /telefoneclientes/1.json
  def destroy
    @telefonecliente.destroy
    respond_to do |format|
      format.html { redirect_to telefoneclientes_url, notice: 'Telefonecliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telefonecliente
      @telefonecliente = Telefonecliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def telefonecliente_params
      params.require(:telefonecliente).permit(:desc_telefone, :tipo_telefone, :cliente_id)
    end
end
