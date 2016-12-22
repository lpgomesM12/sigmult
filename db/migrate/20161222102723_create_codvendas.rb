class CreateCodvendas < ActiveRecord::Migration[5.0]
  def change
    create_table :codvendas do |t|
      t.integer :numr_contador
      t.references :empresa, foreign_key: true

      t.timestamps
    end
  end
end
