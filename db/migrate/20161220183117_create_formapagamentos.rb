class CreateFormapagamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :formapagamentos do |t|
      t.string :nome_formapagamento

      t.timestamps
    end
  end
end
