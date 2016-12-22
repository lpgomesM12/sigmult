class CreateTelefoneclientes < ActiveRecord::Migration[5.0]
  def change
    create_table :telefoneclientes do |t|
      t.string :desc_telefone
      t.string :tipo_telefone
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
