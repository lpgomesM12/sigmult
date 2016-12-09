class CreateMovimentacaoprodutos < ActiveRecord::Migration[5.0]
  def change
    create_table :movimentacaoprodutos do |t|
      t.integer :qtd_produto
      t.string :tipo_movimentacao
      t.decimal :valor_movimentacao, precision: 10, scale: 2
      t.references :produto, foreign_key: true
      t.datetime :data_exclusao
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.integer :user_exclusao, :integer, :references => :User, index: true


      t.timestamps
    end
  end
end
