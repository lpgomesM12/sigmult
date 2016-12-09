class CreateEstoques < ActiveRecord::Migration[5.0]
  def change
    create_table :estoques do |t|
      t.integer :qtd_produto
      t.references :produto, foreign_key: true

      t.timestamps
    end
  end
end
