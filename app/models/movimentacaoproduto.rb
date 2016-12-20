class Movimentacaoproduto < ApplicationRecord
  belongs_to :produto
  belongs_to :empresa


  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao", optional: true

  after_create :altera_estoque

  private
    def altera_estoque
      if self.tipo_movimentacao == "ENTRADA"

        @produto = Estoque.where(produto_id: self.produto_id)
        if @produto.empty?
            #Quando não tem estoque cadastrado para esse produto, cadastra um novo
            Estoque.create(:qtd_produto => self.qtd_produto, :produto_id => self.produto_id)
          else
            #quando já tem produto atualiza com os valores do estoque
            @estoque = Estoque.find(@produto.first.id)
            @qtd_atualizada = (@estoque.qtd_produto + self.qtd_produto)
            Estoque.update(:qtd_produto => @qtd_atualizada, :produto_id => self.produto_id)
        end

      elsif self.tipo_movimentacao == "SAIDA"

            @produto = Estoque.where(produto_id: self.produto_id)
            @estoque = Estoque.find(@produto.first.id)
            @qtd_atualizada = (@estoque.qtd_produto - self.qtd_produto)
            Estoque.update(:qtd_produto => @qtd_atualizada, :produto_id => self.produto_id)

      end
    end

end
