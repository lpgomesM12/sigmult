class CreateVendas < ActiveRecord::Migration[5.0]
  def change
    create_table :vendas do |t|
      t.references :cliente, foreign_key: true
      t.datetime :data_exclusao
      t.references :empresa, foreign_key: true
      t.decimal :valr_desconto, precision: 10, scale: 2
      t.decimal :valr_venda, precision: 10, scale: 2
      t.decimal :valr_total, precision: 10, scale: 2
      t.string :situacao
      t.datetime :data_exclusao
      t.references :formapagamento, foreign_key: true
      t.integer :user_inclusao, :references => :User, index: true
      t.integer :user_exclusao, :references => :User, index: true

      t.timestamps
    end
  end
end
