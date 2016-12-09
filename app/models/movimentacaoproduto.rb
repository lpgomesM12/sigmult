class Movimentacaoproduto < ApplicationRecord
  belongs_to :produto

  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao", optional: true


 after_create :altera_estoque

  private
    def altera_estoque
      if self.tipo_movimentacao == "ENTRADA"


      elsif self.tipo_movimentacao == "SAIDA"

      end
    end

  def entra_estoque
       @produto = Estoque.where(produto_id: self.produto_id)
       if @produto.empty?
           Estoque.create()
         else
       end

  end

end
