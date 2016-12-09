class Produto < ApplicationRecord
  belongs_to :categoriaproduto

  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao", optional: true

  STATUS = %w[Ativo Inativo]



  def self.search(term)
    where("lower(nome_produto)like ?", "%#{term.downcase}%")
  end

end
