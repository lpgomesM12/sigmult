class StaticPagesController < ApplicationController

  before_action :authenticate_user!

  def home
    # caixa aberto
    @caixas = Caixa.where("empresa_id = #{current_user.empresa_id} AND user_fechamento is null")

    #contator
    @data_inicio = Date.today.at_beginning_of_month.strftime('%d/%m/%Y')
    @data_fim  = Date.today.at_end_of_month.strftime('%d/%m/%Y')
    @contVendas = Venda.where("created_at >= '#{@data_inicio}' AND created_at <= '#{@data_fim}'").count

  end
end
