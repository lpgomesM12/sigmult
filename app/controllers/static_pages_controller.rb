class StaticPagesController < ApplicationController

  def home

    if user_signed_in?
      # caixa aberto
      @caixas = Caixa.where("empresa_id = #{current_user.empresa_id} AND user_fechamento is null")

      #contator
      @data_inicio = Date.today.at_beginning_of_month.strftime('%d/%m/%Y')
      @data_fim  = Date.today.at_end_of_month.strftime('%d/%m/%Y')
      @contVendas = Venda.where("created_at >= '#{@data_inicio}' AND created_at <= '#{@data_fim}' AND empresa_id = #{current_user.empresa_id}").count

      @vendas = Venda.where("created_at >= '#{@data_inicio}' AND created_at <= '#{@data_fim}' AND empresa_id = #{current_user.empresa_id}").order("created_at DESC").limit(5)
     end
  end
end
