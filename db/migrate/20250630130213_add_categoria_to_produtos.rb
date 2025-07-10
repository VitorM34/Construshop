# db/migrate/20250630130213_add_categoria_to_produtos.rb
class AddCategoriaToProdutos < ActiveRecord::Migration[7.1]
  def change
    add_reference :produtos, :categoria, foreign_key: true
  end
end
