class CreateContabanks < ActiveRecord::Migration[5.0]
  def change
    create_table :contabanks do |t|
      t.string :nome_banco
      t.string :nome_conta
      t.string :numr_agencia
      t.string :numr_conta
      t.references :empresa, foreign_key: true
      t.datetime :data_exclusao
      t.integer :user_inclusao, :references => :User, index: true
      t.integer :user_exclusao, :references => :User, index: true
      
      t.timestamps
    end
  end
end
