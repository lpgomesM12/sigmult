class Caixa < ApplicationRecord
  belongs_to :empresa
  belongs_to :abertura, :class_name => "User", :foreign_key => "user_abertura"
  belongs_to :fechamento, :class_name => "User", :foreign_key => "user_fechamento", optional: true


before_update :lancamento

private
 def lancamento
    if self.data_fechamento != nil
       @lancamento = Lancamento.new
       @lancamento.nome_lancamento = "Fechamento caixa"
       @lancamento.valr_lancamento = self.valr_caixa
       @lancamento.data_vencimento = Time.zone.now
       @lancamento.data_pagamento = Time.zone.now
       @lancamento.flag_pago = true
       @lancamento.tipo_lancamento = "ENTRADA"
       @lancamento.empresa_id = self.empresa_id
       @lancamento.user_inclusao = self.user_fechamento
       @lancamento.categoriafinaceiro_id = 1
       @lancamento.save
    end
 end

end
