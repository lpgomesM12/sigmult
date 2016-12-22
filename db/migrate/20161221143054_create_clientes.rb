class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.string :nome_cliente
      t.string :cpf
      t.references :endereco, foreign_key: true
      t.datetime :data_exclusao
      t.integer :user_inclusao, :references => :User, index: true
      t.integer :user_exclusao, :references => :User, index: true

      t.timestamps
    end
  end
end
