class Lancamento < ApplicationRecord
  belongs_to :categoriafinaceiro
  belongs_to :formapagamento , optional: true
  belongs_to :fornecedor, optional: true
  belongs_to :empresa
end
