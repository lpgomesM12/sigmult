class CreateCategoriaempresas < ActiveRecord::Migration[5.0]
  def change
    create_table :categoriaempresas do |t|
      t.string :nome_categoria
      t.string :desc_descricao

      t.timestamps
    end
  end
end
