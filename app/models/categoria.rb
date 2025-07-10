class Categoria < ApplicationRecord
  has_many :produtos
  has_many :categoria
end
