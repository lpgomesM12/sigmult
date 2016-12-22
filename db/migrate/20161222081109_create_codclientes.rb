class CreateCodclientes < ActiveRecord::Migration[5.0]
  def change
    create_table :codclientes do |t|
      t.integer :numr_codigo
      t.references :empresa, foreign_key: true

      t.timestamps
    end
  end
end
