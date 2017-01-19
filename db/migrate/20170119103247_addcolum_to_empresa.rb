class AddcolumToEmpresa < ActiveRecord::Migration[5.0]
  def change
      add_reference :empresas, :contabank, foreign_key: true
  end
end
