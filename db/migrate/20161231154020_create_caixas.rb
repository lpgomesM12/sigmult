class CreateCaixas < ActiveRecord::Migration[5.0]
  def change
    create_table :caixas do |t|
      t.datetime :data_abertura
      t.datetime :data_fechamento
      t.decimal :valr_caixa, precision: 10, scale: 2
      t.references :empresa, foreign_key: true
      t.integer :user_abertura, :references => :User, index: true
      t.integer :user_fechamento, :references => :User, index: true

      t.timestamps
    end
  end
end
