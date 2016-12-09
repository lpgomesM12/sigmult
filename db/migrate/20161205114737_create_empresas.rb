class CreateEmpresas < ActiveRecord::Migration[5.0]
  def change
    create_table :empresas do |t|
      t.string :nome_empresa
      t.references :endereco, foreign_key: true
      t.references :categoriaempresa, foreign_key: true
      t.string :cnpj
      t.string :nome_responsavel
      t.string :telefone1
      t.string :telefone2

      t.timestamps
    end
  end
end
