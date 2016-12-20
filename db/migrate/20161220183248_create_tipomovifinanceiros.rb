class CreateTipomovifinanceiros < ActiveRecord::Migration[5.0]
  def change
    create_table :tipomovifinanceiros do |t|
      t.string :nome_movimento

      t.timestamps
    end
  end
end
