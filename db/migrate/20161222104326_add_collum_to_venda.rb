class AddCollumToVenda < ActiveRecord::Migration[5.0]
  def change
    add_column :vendas, :numr_codigo, :integer
  end
end
