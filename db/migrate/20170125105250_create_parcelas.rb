class CreateParcelas < ActiveRecord::Migration[5.0]
  def change
    create_table :parcelas do |t|
      t.decimal :valr_parcela
      t.decimal :valr_desconto, precision: 10, scale: 2
      t.decimal :valr_pago, precision: 10, scale: 2
      t.datetime :data_parcela
      t.datetime :data_pagamento
      t.boolean :flag_pago
      t.integer :numr_parcela
      t.integer :qtd_parcelas
      t.boolean :flag_entrada
      t.references :venda, foreign_key: true
      t.references :empresa, foreign_key: true
      t.integer :user_recebimento, :references => :User, index: true

      t.timestamps
    end
  end
end
