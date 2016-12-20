class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :nome_produto
      t.string :desc_observacao
      t.references :categoriaproduto, foreign_key: true
      t.datetime :data_exclusao
      t.integer :qtd_estoqueminimo
      t.integer :qtd_estoquemaximo
      t.string :nome_marca
      t.string :cod_barras
      t.decimal :valor_custo, precision: 10, scale: 2
      t.decimal :valor_venda, precision: 10, scale: 2
      t.string :desc_tamanho
      t.string :status
      t.string :peso_kilograma
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.integer :user_exclusao, :integer, :references => :User, index: true
      t.references :empresa, foreign_key: true

      t.timestamps
    end
  end
end
