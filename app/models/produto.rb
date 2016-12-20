class Produto < ApplicationRecord
  belongs_to :categoriaproduto
  belongs_to :empresa
  belongs_to :unidademedida

  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao", optional: true

  STATUS = %w[Ativo Inativo]

  after_create :entrada_estoque

  def self.search(term)
    where("lower(nome_produto)like ?", "%#{term.downcase}%")
  end

  private

  def entrada_estoque
    Estoque.create(:qtd_produto => 0, :produto_id => self.id)
  end

end
