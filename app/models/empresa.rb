class Empresa < ApplicationRecord
  belongs_to :endereco, dependent: :destroy
  belongs_to :categoriaempresa

  accepts_nested_attributes_for :endereco, allow_destroy: true

 before_create :dados_padrao

  def endereco_completo
    self.endereco.endereco + " " + self.endereco.complemento + " " + self.endereco.cidade.nome_cidade + " " + self.endereco.cidade.estado.sigl_estado
  end


end
