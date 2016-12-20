class Telefonefornecedor < ApplicationRecord
  belongs_to :fornecedor, optional: true
end
