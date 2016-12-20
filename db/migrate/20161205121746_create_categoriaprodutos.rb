class CreateCategoriaprodutos < ActiveRecord::Migration[5.0]
  def change
    create_table :categoriaprodutos do |t|
      t.string :nome_categoria
      t.integer :father_id, :integer, :references => :categoriaprodutos
      t.references :empresa, foreign_key: true

      t.timestamps
    end
  end
end
