class Venda < ApplicationRecord
  belongs_to :cliente
  belongs_to :empresa
  belongs_to :formapagamento


 before_create  :geraCodigo
 after_create   :atualizaContador
 @@codigo


def geraCodigo
  @@contvenda = Codvenda.find_by empresa_id: self.empresa_id
  @@codigo = @@contvenda.numr_contador
  @@codigo += 1
  self.numr_codigo  = @@codigo
end

def atualizaContador
    @@contvenda.update(:numr_contador => @@codigo)
end


end
