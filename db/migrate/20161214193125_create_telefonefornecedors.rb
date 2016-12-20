class CreateTelefonefornecedors < ActiveRecord::Migration[5.0]
  def change
    create_table :telefonefornecedors do |t|
      t.string :desc_telefone
      t.string :desc_tipo
      t.references :fornecedor, foreign_key: true

      t.timestamps
    end
  end
end
