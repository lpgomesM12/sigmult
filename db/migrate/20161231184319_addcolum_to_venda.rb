class AddcolumToVenda < ActiveRecord::Migration[5.0]
  def change
    add_reference :vendas, :caixa, foreign_key: true
  end
end
