class Categoriafinaceiro < ApplicationRecord
  belongs_to :empresa
  has_many :children, :class_name => "Categoriaproduto", :foreign_key => "father_id"
  belongs_to :father, :class_name => "Categoriaproduto", :foreign_key => "father_id", optional: true
end
