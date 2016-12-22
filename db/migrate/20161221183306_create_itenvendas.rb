class CreateItenvendas < ActiveRecord::Migration[5.0]
  def change
    create_table :itenvendas do |t|
      t.decimal :valor_unitario, precision: 10, scale: 2
      t.integer :qtd_item
      t.decimal :valr_total, precision: 10, scale: 2
      t.references :venda, foreign_key: true
      t.references :produto, foreign_key: true
      t.datetime :data_exclusao
      t.integer :user_inclusao, :references => :User, index: true
      t.integer :user_exclusao, :references => :User, index: true

      t.timestamps
    end
  end
end
