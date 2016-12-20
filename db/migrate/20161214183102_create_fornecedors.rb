class CreateFornecedors < ActiveRecord::Migration[5.0]
  def change
    create_table :fornecedors do |t|
      t.string :nome_fornecedor
      t.string :desc_cnpj
      t.references :endereco, foreign_key: true
      t.references :empresa, foreign_key: true

      t.timestamps
    end
  end
end
