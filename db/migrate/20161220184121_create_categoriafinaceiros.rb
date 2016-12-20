class CreateCategoriafinaceiros < ActiveRecord::Migration[5.0]
  def change
    create_table :categoriafinaceiros do |t|
      t.string :nome_categoria
      t.references :empresa, foreign_key: true
      t.integer :father_id, :integer, :references => :categoriafinaceiros

      t.timestamps
    end
  end
end
