class AddRefToProduto < ActiveRecord::Migration[5.0]
  def change
    add_reference :produtos, :unidademedida, foreign_key: true
  end
end
