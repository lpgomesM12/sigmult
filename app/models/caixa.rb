class Caixa < ApplicationRecord
  belongs_to :empresa
  belongs_to :abertura, :class_name => "User", :foreign_key => "user_abertura"
  belongs_to :fechamento, :class_name => "User", :foreign_key => "user_fechamento", optional: true
end
