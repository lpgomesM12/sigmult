class AddCollumToCliente < ActiveRecord::Migration[5.0]
  def change
    add_reference :clientes, :empresa, foreign_key: true
    add_column :clientes, :numr_codigo, :integer
  end
end
