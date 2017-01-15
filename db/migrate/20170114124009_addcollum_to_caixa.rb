class AddcollumToCaixa < ActiveRecord::Migration[5.0]
  def change
      add_reference :caixas, :lancamento, foreign_key: true
  end
end
