class Itenvenda < ApplicationRecord
  belongs_to :venda
  belongs_to :produto

  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao", optional: true
  
end
