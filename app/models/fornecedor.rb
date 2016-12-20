class Fornecedor < ApplicationRecord
  belongs_to :endereco
  belongs_to :empresa
  has_many :telefonefornecedors, dependent: :destroy

  accepts_nested_attributes_for :endereco, allow_destroy: true
  accepts_nested_attributes_for :telefonefornecedors, allow_destroy: true


  TIPOCONTATO = %w[Celular Fixo]

  def self.search(term)
    where("lower(nome_fornecedor)like ?", "%#{term.downcase}%")
  end

end
