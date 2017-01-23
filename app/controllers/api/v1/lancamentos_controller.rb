class Api::V1::LancamentosController < Api::V1::ApplicationController
  # GET /api/v1/lancamentos/
 include ActionView::Helpers::NumberHelper

  def index
    @lancamentos = Lancamento.where(empresa_id: params[:empresa_id])
  end

end
