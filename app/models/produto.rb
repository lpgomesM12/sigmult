class Produto < ApplicationRecord
  belongs_to :categoriaproduto
  belongs_to :empresa
  belongs_to :unidademedida

  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao", optional: true

  STATUS = %w[Ativo Inativo]

  after_create :entrada_estoque

  attr_accessor :valr_unitario

  def valr_unitario
    @valr_unitario
  end

  # setter
  def valr_unitario=(val)
    @valr_unitario = val
  end


  def self.search(term,empresa_id)
    where("lower(nome_produto)like ? AND empresa_id = ?", "%#{term.downcase}%", "#{empresa_id}")
  end

  private

  def entrada_estoque
    Estoque.create(:qtd_produto => 0, :produto_id => self.id)
  end

end
