class CreateUnidademedidas < ActiveRecord::Migration[5.0]
  def change
    create_table :unidademedidas do |t|
      t.string :nome_unidade
      t.references :empresa, foreign_key: true

      t.timestamps
    end
  end
end
