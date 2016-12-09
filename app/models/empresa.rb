class Empresa < ApplicationRecord
  belongs_to :endereco
  belongs_to :categoriaempresa
end
