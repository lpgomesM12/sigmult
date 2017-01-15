class CreateLancamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :lancamentos do |t|
      t.string :nome_lancamento
      t.decimal :valr_lancamento, precision: 10, scale: 2
      t.decimal :valr_desconto, precision: 10, scale: 2
      t.decimal :valr_juros, precision: 10, scale: 2
      t.datetime :data_vencimento
      t.datetime :data_pagamento
      t.boolean :flag_pago
      t.integer :numr_recorrencia
      t.integer :numr_parcela
      t.integer :numr_referenciparcela
      t.string :situacao
      t.datetime :data_exclusao
      t.string :tipo_lancamento
      t.references :categoriafinaceiro, foreign_key: true
      t.references :formapagamento, foreign_key: true
      t.references :fornecedor, foreign_key: true
      t.references :empresa, foreign_key: true
      t.integer :user_inclusao, :references => :User, index: true
      t.integer :user_exclusao, :references => :User, index: true

      t.timestamps
    end
  end
end
