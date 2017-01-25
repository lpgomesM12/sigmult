class Parcela < ApplicationRecord
  belongs_to :venda
  belongs_to :empresa
  belongs_to :recebimento, :class_name => "User", :foreign_key => "user_recebimento", optional: true
end
