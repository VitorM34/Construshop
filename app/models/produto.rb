# app/models/produto.rb
class Produto < ApplicationRecord
  has_many :item_carrinhos
  has_many :carrinhos, through: :item_carrinhos
  belongs_to :user
  has_one_attached :imagem

  # def promocao?
  # preco_original.present? && preco_original > preco
  # end

  broadcasts_to ->(produto) { "produtos" },
    inserts_by: :prepend,
      target: "produtos"
end
