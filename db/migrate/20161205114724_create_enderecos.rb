class CreateEnderecos < ActiveRecord::Migration[5.0]
  def change
    create_table :enderecos do |t|
      t.string :endereco
      t.string :cep
      t.string :complemento
      t.references :cidade, foreign_key: true

      t.timestamps
    end
  end
end
